import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/data/data_model/category_data_model.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseServices {
  static CollectionReference<EventDM> getEventsCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventDM> eventsCollection = db
        .collection("events")
        .withConverter<EventDM>(
          fromFirestore: (snapshot, _) => EventDM.fromJson(snapshot.data()!),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireBase(EventDM event) async {
    CollectionReference<EventDM> eventsCollection = getEventsCollection();
    DocumentReference<EventDM> document = eventsCollection.doc();
    event.id = document.id;
    await document.set(event);
  }

  static Future<List<EventDM>> getOneTimeEventsFromFireBase(
    CategoryDM category,
  ) async {
    CollectionReference<EventDM> eventCollection = getEventsCollection();
    QuerySnapshot<EventDM> querySnapshot =
        await eventCollection
            .where(
              "categoryId",
              isEqualTo: category.id == 0 ? null : category.id,
            )
            .orderBy("dateTime")
            .get();
    List<EventDM> events = querySnapshot.docs.map((e) => e.data()).toList();
    return events;
  }

  static Stream<List<EventDM>> getRealTimeEventsFromFireBase(
    CategoryDM category,
  ) async* {
    CollectionReference<EventDM> eventCollection = getEventsCollection();
    Stream<QuerySnapshot<EventDM>> snapShots =
        eventCollection
            .where(
              "categoryId",
              isEqualTo: category.id == 0 ? null : category.id,
            )
            .orderBy("dateTime")
            .snapshots();
    Stream<List<EventDM>> eventStream = snapShots.map(
      (querySnapshot) =>
          querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
    );
    yield* eventStream;
  }

  static Future<List<EventDM>> getFavEventsFromFireBase() async {
    CollectionReference<EventDM> eventCollection = getEventsCollection();
    QuerySnapshot<EventDM> querySnapshot =
        await eventCollection
            .where("id", whereIn: UserDataModel.currentUser!.favEventsList)
            .orderBy("dateTime")
            .get();
    List<EventDM> events =
        querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
    return events;
  }

  static CollectionReference<UserDataModel> getUserCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserDataModel> userCollection = db
        .collection("Users")
        .withConverter(
          fromFirestore:
              (snapshot, _) => UserDataModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return userCollection;
  }

  static Future<void> addUserToFireBase(UserDataModel userDM) async {
    CollectionReference<UserDataModel> userCollection = getUserCollection();
    DocumentReference<UserDataModel> userDocs = userCollection.doc(userDM.id);
    await userDocs.set(userDM);
  }

  static Future<UserDataModel> getUserFromFireBase(String uid) async {
    CollectionReference<UserDataModel> userCollection = getUserCollection();
    DocumentReference<UserDataModel> userDocs = userCollection.doc(uid);
    DocumentSnapshot<UserDataModel> documentSnapshot = await userDocs.get();
    UserDataModel user = documentSnapshot.data() as UserDataModel;
    return user;
  }

  static Future<void> signUp(String email, String password, String name) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserDataModel userDM = UserDataModel(
      id: credential.user!.uid,
      name: name,
      email: email,
      favEventsList: [],
    );
    await addUserToFireBase(userDM);
  }

  static Future<void> signIn(String email, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserDataModel user = await getUserFromFireBase(credential.user!.uid);
    UserDataModel.currentUser = user;
  }

  static Future<void> updateUserData(UserDataModel userDM) async {
    CollectionReference<UserDataModel> userCollection = getUserCollection();
    DocumentReference<UserDataModel> userDocs = userCollection.doc(userDM.id);
    await userDocs.set(userDM, SetOptions(merge: true));
  }

  static addEventToFavorite(EventDM event) async {
    UserDataModel user = UserDataModel.currentUser!;
    user.favEventsList.add(event.id);
    await addUserToFireBase(user);
  }

  static removeEventToFavorite(EventDM event) async {
    UserDataModel user = UserDataModel.currentUser!;
    user.favEventsList.remove(event.id);
    await updateUserData(user);
  }

  static late bool isGoogleUserCreated;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> signInWithGoogle() async {
    await _googleSignIn.signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    isGoogleUserCreated = googleUser != null;
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    UserDataModel userDM = UserDataModel(
      id: userCredential.user!.uid,
      name: userCredential.user!.displayName!,
      email: userCredential.user!.email!,
      favEventsList: [],
    );
    await addUserToFireBase(userDM);
    UserDataModel user = await getUserFromFireBase(userCredential.user!.uid);
    UserDataModel.currentUser = user;
  }
}

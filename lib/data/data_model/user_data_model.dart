class UserDataModel {
  static UserDataModel? currentUser;

  String id;
  String name;
  String email;
  List<String> favEventsList;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favEventsList,
  });

  UserDataModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        favEventsList:
            (json["favEventsList"] as List<dynamic>)
                .map((e) => e.toString())
                .toList(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "favEventsList": favEventsList,
  };
}

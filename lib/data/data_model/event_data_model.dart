import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:evently_app/data/data_model/category_data_model.dart';

class EventDM {
  String id;
  final CategoryDM? category;
  final String title;
  final String uid;
  final String description;
  final DateTime dateTime;
  final int? lat;
  final int? lng;

  EventDM({
    this.id = "",
    this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    this.lat,
    this.lng, required this.uid,
  });

  EventDM.fromJson(Map<String, dynamic> json) :this(
      id: json["id"],
      uid: json["uid"],
      title: json["title"],
      description: json["description"],
      dateTime: (json["dateTime"] as Timestamp).toDate(),
      category: ConstantManager.categoriesWithoutAll.firstWhere(
            (category) => category.id == json["categoryId"],
      )
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "uid": uid,
        "categoryId": category?.id,
        "title": title,
        "description": description,
        "dateTime": Timestamp.fromDate(dateTime),
      };
}

import 'package:flutter/material.dart';

class EventDM {
  final String category;
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final int? lan;
  final int? lng;

  EventDM({
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.lan,
    this.lng,
  });
}

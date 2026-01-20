import 'package:intl/intl.dart';

extension DataFormte on DateTime {
  String get getMonthFromDate {
    DateFormat formatter = DateFormat("MMMM");
    return formatter.format(this);
  }
}

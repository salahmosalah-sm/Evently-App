import 'package:intl/intl.dart';

extension DataFormte on DateTime {
  String get getMonthFromDate {
    DateFormat formatter = DateFormat("MMMM");
    return formatter.format(this);
  }

  String get formatDate {
    DateFormat formatter = DateFormat("dd-MM-yyyy");
    return formatter.format(this);
  }

  String get formatDateWithMonth {
    DateFormat formatter = DateFormat("dd MMMM yyyy");
    return formatter.format(this);
  }

  String get formatTime {
    DateFormat formatter = DateFormat("hh:mm a");
    return formatter.format(this);
  }
}

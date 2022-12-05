import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get getStartDate {
    DateFormat transactionDateFormat = DateFormat('dd/MM/yyyy');
    return transactionDateFormat.format(this);
  }

  String get getEndDate {
    DateFormat transactionDateFormat = DateFormat('dd/MM/yyyy');
    return transactionDateFormat.format(this);
  }
}

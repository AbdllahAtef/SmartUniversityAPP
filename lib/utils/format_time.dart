import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String get formattedDate => DateFormat('d MMMM').format(this);
  String get formattedTime => DateFormat('hh:mm a').format(this);
}

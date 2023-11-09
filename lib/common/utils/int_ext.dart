import 'package:intl/intl.dart';

extension IntExt on int {
  String? formatIDR() {
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0);
    return formatCurrency.format(this);
  }
}

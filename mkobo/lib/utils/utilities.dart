import 'package:intl/intl.dart';

class Utils {
  static String numberToAmount(num number) {
    var f = NumberFormat('###,###,###,###.00#', 'en_US');
    return f.format(number);
  }
}

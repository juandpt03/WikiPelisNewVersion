import 'package:intl/intl.dart';
import 'package:wikipelis/presentation/utils/app_language/app_language.dart';

class HumanFormats {
  static String number(double number, [int decimal = 0]) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimal,
      symbol: '',
      locale: 'en',
    ).format(number);
    return formatterNumber;
  }

  static String shortDate(DateTime date) {
    final format = DateFormat.yMMMEd(AppLanguage.getLocale().toString());
    return format.format(date);
  }
}

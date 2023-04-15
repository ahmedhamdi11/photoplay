import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static String? uId;
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
}

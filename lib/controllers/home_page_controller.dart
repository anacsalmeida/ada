import 'dart:convert';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController {
  var user = {};
  VoidCallback? updateState;

  void getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    user = jsonDecode(sharedPreferences.getString('user')!);
    updateState!.call();
  }
}

import 'dart:convert';
import 'package:ada/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatorController {
  final _serviceUser = UserService();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerAbout = TextEditingController();
  final controllerEducation = TextEditingController();
  final controllerProfession = TextEditingController();

  Future<dynamic> login(BuildContext context) async {
    try {
      var email = controllerEmail.text;
      var password = controllerPassword.text;
      var credential = await _serviceUser.login(email, password);
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString('user', jsonEncode(credential));
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      return e;
    }
  }
}

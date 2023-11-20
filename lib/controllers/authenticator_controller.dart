import 'dart:convert';

import 'package:ada/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

//objetos do banco
class AuthenticatorController {
  //instanciando service
  final _serviceUser = UserService();

  //pega dados do input
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerAbout = TextEditingController();
  final controllerEducation = TextEditingController();
  final controllerProfession = TextEditingController();

  // createUser() async {
  //   await _serviceHome.createUser({
  //     'name': controllerName.text,
  //     'email': controllerEmail.text,
  //     'password': controllerPassword.text,
  //     'date': controllerDate.text,
  //     'about_me': controllerAbout.text,
  //     'education': controllerEducation.text,
  //     'profession': controllerProfession.text
  //   });
  // }

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

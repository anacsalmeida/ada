import 'package:ada/services/user_service.dart';
import 'package:flutter/cupertino.dart';

//objetos do banco
class AuthenticatorController {
  final _serviceUser = UserService();
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

  login() async {
    try {
      var email = controllerEmail.text;
      var password = controllerPassword.text;
      var credential = await _serviceUser.login(email, password);
      // var user = credential["user"];
      print(credential.user.uid);
    } catch (e) {
      return e;
    }
  }
}

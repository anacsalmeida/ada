import 'package:ada/services/user_service.dart';
import 'package:flutter/cupertino.dart';

//objetos do banco
class AuthenticatorController {
  final _serviceHome = UserService();
  final controllerBaner = TextEditingController();
  final controllerTitulo = TextEditingController();
  final controllerAno = TextEditingController();
  final controllerDescricao = TextEditingController();

  createUser() async {
    await _serviceHome.createUser();
  }
}

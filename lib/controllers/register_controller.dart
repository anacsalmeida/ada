import 'package:flutter/cupertino.dart';

import '../services/user_service.dart';
import '../widgets/error_alert.dart';

class RegisterController {
  final _serviceUser = UserService();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  Future<void> createUser(BuildContext context) async {
    if(verifyValidForm()){
      try {
        var email = controllerEmail.text;
        var password = controllerPassword.text;
        await _serviceUser.createUser(email, password);

        GeneralAlert().showErrorModal(context, () {
          Navigator.of(context).pushReplacementNamed('/login');
        }, 'Usuário cadastrado com sucesso!', 0.05);
      } catch (e) {
        GeneralAlert().showErrorModal(context, () {
          Navigator.pop(context);
        }, 'Erro ao cadastrar usuário!', 0.05);
      }
    } else {
      GeneralAlert().showErrorModal(context, () {
        Navigator.pop(context);
      }, 'As senhas devem ser iguais!', 0.05);
    }
  }

  bool verifyValidForm(){
    var password = controllerPassword.text;
    var confirmPassword = controllerConfirmPassword.text;

    if(password != confirmPassword){
      return false;
    }

    return true;
  }
}

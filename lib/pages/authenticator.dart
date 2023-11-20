import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controllers/authenticator_controller.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key}) : super(key: key);

  @override
  State<Authenticator> createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  final _controllerAuth = AuthenticatorController();

  // ControllerCadastroPage controllerCadastro = new ControllerCadastroPage();
  // ControllerLoginPage controllerLogin = new ControllerLoginPage();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void showToast(String msgErr) {
    Fluttertoast.showToast(
      msg: msgErr,
      fontSize: 15,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Conecte-se'),
          backgroundColor: const Color.fromARGB(255, 191, 63, 97)),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: size.height * 0.04),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.40,
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/logobg.png'),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.08,
                          right: size.width * 0.08,
                          bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(
                          width: 3,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _controllerAuth.controllerEmail,
                        decoration: const InputDecoration(
                            hintText: 'E-mail',
                            fillColor: Colors.black,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10)),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite algum texto';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.08,
                          right: size.width * 0.08,
                          bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(
                          width: 3,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _controllerAuth.controllerPassword,
                        decoration: const InputDecoration(
                            hintText: 'Senha',
                            fillColor: Colors.black,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10)),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite algum texto';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          width: 220.0,
                          height: 45.0,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller:
                                _controllerAuth.login(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 191, 63, 97),
                                textStyle: const TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            child: const Text('Entrar'),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ]),
        ),
      ),
    );
  }
}

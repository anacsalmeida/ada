import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import '../controllers/authenticator_controller.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key}) : super(key: key);

  @override
  State<Authenticator> createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  final _authController = AuthenticatorController();

  // ControllerCadastroPage controllerCadastro = new ControllerCadastroPage();
  // ControllerLoginPage controllerLogin = new ControllerLoginPage();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  // void showToast(String msgErr) {
  //   Fluttertoast.showToast(
  //     msg: msgErr,
  //     fontSize: 15,
  //     gravity: ToastGravity.BOTTOM,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 238, 247),
            image: DecorationImage(
              image: AssetImage("../../assets/images/bg.png"),
              repeat: ImageRepeat.repeatX,
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    bottom: 10,
                  ),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Bem-vinda!",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 51, 115, 103),
                            fontWeight: FontWeight.bold),
                      )),
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
                        color: Colors.white,
                        border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 217, 143, 170),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _authController.controllerEmail,
                        decoration: const InputDecoration(
                            hintText: 'E-mail',
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
                        color: Colors.white,
                        border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 217, 143, 170),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _authController.controllerPassword,
                        decoration: const InputDecoration(
                            hintText: 'Senha',
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        width: 220.0,
                        height: 45.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller:
                              _authController.login(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 121, 168, 159),
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  const Color.fromARGB(255, 151, 210, 199),
                              textStyle: const TextStyle(
                                  fontSize: 25, color: Colors.white)),
                          child: const Text('Entrar'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

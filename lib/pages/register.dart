import 'package:flutter/material.dart';

import '../controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) => Scaffold(
        backgroundColor: const Color(0xFFFFEEF7),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                color: Color(0xFFBF3F61),
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/top_bar.png',
                    width: constrains.maxWidth,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 46.0, left: 16.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 100,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 52.0, left: 42.0),
                        child: Text(
                          "Ada",
                          style: TextStyle(
                            fontFamily: 'Kaisei HarunoUmi',
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 36.0, top: 36.0),
                child: Text(
                  "Cadastre-se!",
                  style: TextStyle(
                    fontFamily: 'Kaisei HarunoUmi',
                    fontSize: 30,
                    color: Color(0xFF337367),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: TextFormField(
                  controller: _registerController.controllerEmail,
                  onTapOutside: (tap) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xFF97D2C7),
                    ),
                    labelText: 'E-mail',
                    labelStyle: const TextStyle(
                      fontFamily: 'Kaisei HarunoUmi',
                      fontSize: 13,
                      color: Color(0xFF337367),
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFD98FAA),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFD98FAA),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: TextFormField(
                  controller: _registerController.controllerPassword,
                  onTapOutside: (tap) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF97D2C7),
                    ),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(
                      fontFamily: 'Kaisei HarunoUmi',
                      fontSize: 13,
                      color: Color(0xFF337367),
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFD98FAA),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFD98FAA),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: TextFormField(
                  controller: _registerController.controllerConfirmPassword,
                  onTapOutside: (tap) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF97D2C7),
                    ),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(
                      fontFamily: 'Kaisei HarunoUmi',
                      fontSize: 13,
                      color: Color(0xFF337367),
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFD98FAA),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFD98FAA),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 231,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _registerController.createUser(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF97D2C7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          width: 1.5,
                          color: Color(0xFF79A89F),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                        fontFamily: 'Kaisei HarunoUmi',
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: const Text(
                    "Voltar",
                    style: TextStyle(
                      fontFamily: 'Kaisei HarunoUmi',
                      fontSize: 18,
                      color: Color(0xFFD98FAA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

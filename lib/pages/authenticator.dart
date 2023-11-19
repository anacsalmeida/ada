import 'package:flutter/material.dart';
import '../controllers/authenticator_controller.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key}) : super(key: key);

  @override
  State<Authenticator> createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  final _controllerAuth = AuthenticatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 170, 46, 87),
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 233, 135, 167),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Página de Anúncios",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Dados'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/dados");
                  },
                ),
                ElevatedButton(
                  child: const Text('Favoritos'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/favoritos");
                  },
                ),
                ElevatedButton(
                  child: const Text('Testar DB'),
                  onPressed: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, "/");
                    _controllerAuth.createUser();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

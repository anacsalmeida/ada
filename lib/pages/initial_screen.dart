import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'authenticator.dart';
//splash screan

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Widget initialScreean = const Authenticator();

  void updatedState() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset('assets/images/logobg.png'),
        backgroundColor: const Color.fromARGB(255, 191, 63, 97),
        nextScreen: initialScreean,
        splashIconSize: 250,
        duration: 350);
  }
}

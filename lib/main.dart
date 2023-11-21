import 'package:ada/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyDNNREqcqXkGa_b4bgDFeMSXvCubbCGxJs',
        appId: '1:427649541283:android:d05a538ca7d84178e38b16',
        messagingSenderId: '427649541283',
        projectId: 'adalovelace-66fb1'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ada',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 191, 63, 97),
        ),
        // useMaterial3: true,
      ),
      routes: routes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import '../controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomePageController();

  void updatedState() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    _homeController.getUserData();
    _homeController.updateState = updatedState;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 238, 247),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            _homeController.user['name'] != null
                ? _homeController.user["name"]
                : "la",
            style: const TextStyle(
              fontSize: 22,
              color: const Color.fromARGB(255, 191, 63, 97),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

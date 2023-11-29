import 'package:ada/pages/publications_page_view.dart';
import 'package:flutter/material.dart';
import '../controllers/home_page_controller.dart';
import '../data/users.dart';
import 'events_page_view.dart';
import 'forum_page_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomePageController();
  final PageController _pageController = PageController();
  late final List<Widget> pages;

  void updatedState() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    _homeController.getUserData();
    _homeController.updateState = updatedState;

    pages = <Widget>[
      const PublicationsPageView(),
      const ForumPageView(),
      const EventsPageView(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) => Scaffold(
        backgroundColor: const Color(0xFFBF3F61),
        appBar: AppBar(
          backgroundColor: const Color(0xFFBF3F61),
          elevation: 0,
          title: const Text(
            "Ada",
            style: TextStyle(
              fontFamily: 'Kaisei HarunoUmi',
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          actions: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFFBF3F61),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          _homeController.user!["image"]!,
                        ),
                        backgroundColor: Color.fromARGB(255, 211, 240, 235)
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            _homeController.user['name']!,
                            style: const TextStyle(
                              fontFamily: 'Kaisei HarunoUmi',
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            _homeController.user['email']!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Kaisei HarunoUmi',
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.feed,
                  color: Colors.white,
                  size: 36,
                ),
                title: const Text(
                  'Publicações',
                  style: TextStyle(
                    fontFamily: 'Kaisei HarunoUmi',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  _pageController.jumpToPage(0);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.forum,
                  color: Colors.white,
                  size: 36,
                ),
                title: const Text(
                  'Forum',
                  style: TextStyle(
                    fontFamily: 'Kaisei HarunoUmi',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  _pageController.jumpToPage(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.event,
                  color: Colors.white,
                  size: 36,
                ),
                title: const Text(
                  'Eventos',
                  style: TextStyle(
                    fontFamily: 'Kaisei HarunoUmi',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  _pageController.jumpToPage(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 36,
                ),
                title: const Text(
                  'Sair',
                  style: TextStyle(
                    fontFamily: 'Kaisei HarunoUmi',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 8),
          height: constrains.maxHeight,
          width: constrains.maxWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Colors.white,
          ),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (context, i) => pages[i],
          )
        ),
      ),
    );
  }
}

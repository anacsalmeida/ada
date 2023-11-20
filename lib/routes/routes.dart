import 'package:ada/pages/authenticator.dart';
import 'package:ada/pages/home_page.dart';
import 'package:ada/pages/initial_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes() {
  return {
    '/': (context) => const InitialScreen(),
    '/login': (context) => const Authenticator(),
    '/home': (context) => const HomePage(),
    // '/favoritos': (context) => const FavoritosPage(),
    // '/modelo': (context) => const ModeloPage(),
    // '/column': (context) => const ColumnPage(),
    // '/colrow': (context) => const ColRowPage(),
    // '/tabbar': (context) => const TabBarPage(),
    // '/navmanual': (context) => const NavManualPage(),
  };
}

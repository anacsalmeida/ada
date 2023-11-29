import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/publications.dart';
import '../models/publication.dart';

class HomePageController {
  VoidCallback? updateState;
  List<Publication> publicationsList = publications;
  var user = {"name": "", "email": "", "image": ""};

  void getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var jsonUser = jsonDecode(sharedPreferences.getString('user')!);
    user["name"] = jsonUser["name"];
    user["email"] = jsonUser["email"];

    if(user["name"]!.contains("camila")){
      user["image"] = publications[0].image;
    } else if(user["name"]!.contains("eyshila")){
      user["image"] = publications[3].image;
    } else {
      user["image"] = publications[1].image;
    }
    
    updateState!.call();
  }

  void filter(String query){
    final listFinal = publications.where((element) => element.description?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
    publicationsList = listFinal;
    updateState!.call();
  }

  void add(){
    var random = Random().nextInt(8);
    if(random == 0) random = 1;

    var pub = Publication(
      id: "1",
      description: publications[random].description,
      user: user["name"]!,
      image: publications[random].image,
    );
    publicationsList.add(pub);
    updateState!.call();
  }
}

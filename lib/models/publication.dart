import 'package:ada/models/user.dart';

class Publication {
  final String id;
  final String description;
  final String user;
  final String image;

  Publication({
    required this.id,
    required this.description,
    required this.user,
    required this.image,
  });
}
import 'package:ada/models/user.dart';

class Event {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final List<User?> participants;

  Event({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.participants,
  });
}
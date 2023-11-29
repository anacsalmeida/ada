import 'package:ada/data/users.dart';

import '../models/event.dart';

List<Event> events = [
  Event(
    title: "Evento 1",
    description: "Descrição do evento 1",
    startTime: DateTime(2021, 10, 10, 10, 10),
    endTime: DateTime(2021, 10, 10, 12, 10),
    participants: [users[0], users[1], users[2]],
  ),
  Event(
    title: "Evento 2",
    description: "Descrição do evento 2",
    startTime: DateTime(2021, 9, 9, 08, 0),
    endTime: DateTime(2021, 9, 9, 12, 10),
    participants: [users[1], users[2], users[3]],
  ),
  Event(
    title: "Evento 3",
    description: "Descrição do evento 3",
    startTime: DateTime(2021, 8, 8, 08, 0),
    endTime: DateTime(2021, 8, 8, 12, 10),
    participants: [users[2], users[3], users[4]],
  ),
  Event(
    title: "Evento 4",
    description: "Descrição do evento 4",
    startTime: DateTime(2021, 7, 7, 08, 0),
    endTime: DateTime(2021, 7, 7, 12, 10),
    participants: [users[3], users[4], users[5]],
  ),
  Event(
    title: "Evento 5",
    description: "Descrição do evento 5",
    startTime: DateTime(2021, 6, 6, 08, 0),
    endTime: DateTime(2021, 6, 6, 12, 10),
    participants: [users[4], users[5], users[6]],
  ),
  Event(
    title: "Evento 6",
    description: "Descrição do evento 6",
    startTime: DateTime(2021, 11, 11, 08, 0),
    endTime: DateTime(2021, 11, 11, 12, 10),
    participants: [users[4], users[5], users[6]],
  ),
  Event(
    title: "Evento ",
    description: "Descrição do evento 7",
    startTime: DateTime(2021, 7, 7, 08, 0),
    endTime: DateTime(2021, 7, 7, 12, 10),
    participants: [users[4], users[5], users[6]],
  ),
];

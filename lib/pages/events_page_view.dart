import 'package:ada/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/events.dart';
import '../models/event.dart';

class EventsPageView extends StatefulWidget {
  const EventsPageView({super.key});

  @override
  State<EventsPageView> createState() => _EventsPageViewState();
}

class _EventsPageViewState extends State<EventsPageView> {
  final eventList = events;
  late Event nextEvent;

  @override
  void initState() {
    eventList.sort((a, b) => a.startTime.compareTo(b.startTime));
    nextEvent = events.first;
    eventList.removeAt(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentDate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.event,
                color: Color(0xFF121212),
                size: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Eventos',
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 18,
                  fontFamily: 'Kaisei HarunoUmi',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFBF3F61),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              "Reunião mais próxima",
              style: TextStyle(
                color: Color(0xFFBF3F61),
                fontSize: 14,
                fontFamily: 'Kaisei HarunoUmi',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          )
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEEF7),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFBF3F61),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.event,
                    color: Color(0xFFBF3F61),
                    size: 52,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nextEvent.title,
                      style: const TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 14,
                        fontFamily: 'Kaisei HarunoUmi',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      nextEvent.description,
                      style: const TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 12,
                        fontFamily: 'Kaisei HarunoUmi',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      "${nextEvent.startTime.hour}:${nextEvent.startTime.minute} até ${nextEvent.endTime.hour}:${nextEvent.endTime.minute}",
                      style: const TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 12,
                        fontFamily: 'Kaisei HarunoUmi',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              final isDifferentDay = currentDate != eventList[index].startTime;
              currentDate = eventList[index].startTime;
              final currentDayWeek = DateFormat.MMMMEEEEd().format(eventList[index].startTime);

              return Column(
                children: [
                  isDifferentDay ?
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32.0, left: 24.0),
                        child: Text(
                          currentDayWeek,
                          style: const TextStyle(
                            color: Color(0xFFBF3F61),
                            fontSize: 15,
                            fontFamily: 'Kaisei HarunoUmi',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ),
                    ) : const SizedBox(),
                  const Divider(
                    color: Color(0xFFDFDFDF),
                    thickness: 1,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16.0),
                          height: 100,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Color(0xFFBF3F61),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              eventList[index].title,
                              style: const TextStyle(
                                color: Color(0xFFBF3F61),
                                fontSize: 14,
                                fontFamily: 'Kaisei HarunoUmi',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            Text(
                              eventList[index].description,
                              style: const TextStyle(
                                color: Color(0xFF1D1D1D),
                                fontSize: 12,
                                fontFamily: 'Kaisei HarunoUmi',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              getParticipants(eventList[index].participants),
                              style: const TextStyle(
                                color: Color(0xFFBF3F61),
                                fontSize: 12,
                                fontFamily: 'Kaisei HarunoUmi',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if(index == eventList.length - 1)
                    const SizedBox(
                      height: 32,
                    ),
                ],
              );
            }
          ),
        ),
      ],
    );
  }
}

String getParticipants(List<User?> participants) {
  var participantsString = "";
  for (var i = 0; i < participants.length; i++) {
    participantsString += "@${participants[i]!.name}";
    if (i != participants.length - 1) {
      participantsString += ", ";
    }
  }
  return participantsString;
}

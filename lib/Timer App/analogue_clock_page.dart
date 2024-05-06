import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/global.dart';

class AnalogueClockPage extends StatefulWidget {
  const AnalogueClockPage({super.key});

  @override
  State<AnalogueClockPage> createState() => _AnalogueClockPageState();
}

class _AnalogueClockPageState extends State<AnalogueClockPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: (index != 2)
              ? BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img[index]),
                    fit: BoxFit.cover,
                  ),
                )
              : const BoxDecoration(
                  color: Colors.black,
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(dateTime.hour > 12) ? (dateTime.hour % 12).toString().padLeft(2, '0') : (dateTime.hour).toString().padLeft(2, '0')} : ${(dateTime.minute).toString().padLeft(2, '0')} : ${(dateTime.second).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        // fontFamily: 'Digital',
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 22, left: 6),
                    child: Text(
                      (dateTime.hour > 12) ? 'PM' : 'AM',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          // fontFamily: 'Digital',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                '${days[dateTime.weekday - 1]}  ${dateTime.day} ${month[dateTime.month - 1]}',
                style: const TextStyle(
                    color: Colors.white,
                    // fontFamily: 'Digital',
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 150, top: 120),
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 5,
                    color: Colors.white,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // TODO Dot
                    Container(
                      height: 13,
                      width: 13,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                    // TODO Angles
                    ...List.generate(
                      60,
                      (index) => Transform.rotate(
                        angle: ((index) * 6 * pi) / 180,
                        child: ((index) % 5 == 0)
                            ? const VerticalDivider(
                                thickness: 3,
                                color: Colors.red,
                                endIndent: 185,
                              )
                            : const VerticalDivider(
                                thickness: 2,
                                color: Colors.grey,
                                endIndent: 192,
                              ),
                      ),
                    ),
                    // TODO Hour
                    Transform.rotate(
                      angle: (dateTime.hour + (dateTime.minute / 60)) *
                          30 *
                          pi /
                          180,
                      child: const VerticalDivider(
                        thickness: 4,
                        color: Colors.red,
                        indent: 50,
                        endIndent: 95,
                      ),
                    ),
                    // TODO Minute
                    Transform.rotate(
                      angle: (dateTime.minute * 6 * pi) / 180,
                      child: const VerticalDivider(
                        thickness: 3,
                        color: Colors.white,
                        indent: 35,
                        endIndent: 98,
                      ),
                    ),
                    // TODO Second
                    Transform.rotate(
                      angle: (dateTime.second * 6 * pi) / 180,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: Colors.grey,
                        indent: 25,
                        endIndent: 98,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF202020),
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/');
                },
                child:
                    buildIconWithText(icon: Icons.fiber_dvr, data: 'Digital'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/AnalogueClock');
                },
                child:
                    buildIconWithText(icon: Icons.schedule, data: 'Analogue'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/StrapWatch');
                },
                child: buildIconWithText(icon: Icons.timelapse, data: 'Strap'),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (index == 2) {
                      index = 0;
                    } else {
                      index++;
                    }
                  });
                },
                child: buildIconWithText(icon: Icons.wallpaper, data: 'Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

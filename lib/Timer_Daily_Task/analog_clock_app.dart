import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practice_of_lecture/utils/global.dart';

class AnalogClockApp extends StatefulWidget {
  const AnalogClockApp({super.key});

  @override
  State<AnalogClockApp> createState() => _AnalogClockAppState();
}

class _AnalogClockAppState extends State<AnalogClockApp> {
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(dateTime.hour % 12).toString().padLeft(2, '0')} : ${(dateTime.minute).toString().padLeft(2, '0')} : ${(dateTime.second).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 52,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 22, left: 6),
                      child: Text(
                        (dateTime.hour > 12) ? 'PM' : 'AM',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 120, bottom: 190),
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
                            angle: ((index + 1) * 6 * pi) / 180,
                            child: ((index + 1) % 5 == 0)
                                ? const VerticalDivider(
                                    thickness: 3,
                                    color: Colors.red,
                                    endIndent: 185,
                                  )
                                : const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey,
                                    endIndent: 192,
                                  )),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (index == 2) {
                      index = 0;
                    } else {
                      index++;
                    }
                  });
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Change Theme',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

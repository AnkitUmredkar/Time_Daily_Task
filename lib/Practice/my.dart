import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/global.dart';

class MyClock extends StatefulWidget {
  const MyClock({super.key});

  @override
  State<MyClock> createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double clockSize = min(width * 0.8, height * 0.4);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Clock',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: width * 0.56,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF1A1A1A),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade800,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(2, 2),
                          ),
                          const BoxShadow(
                            color: Colors.black,
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.language,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 10,
                  ),
                  child: buildContainer(clockSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer(double clockSize) {
    return Container(
                  height: clockSize,
                  width: clockSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        constraints: const BoxConstraints.expand(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(colors: [
                            Color(0xFF1A1A1A),
                            Color(0xFF121212),
                          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              blurRadius: 32,
                              spreadRadius: 1,
                              offset: Offset(-20, -10),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.13),
                              blurRadius: 32,
                              spreadRadius: 1,
                              offset: const Offset(30, 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: clockSize * 0.465,
                        width: clockSize * 0.465,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF1A1A1A),
                              Color(0xFF121212),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              blurRadius: 32,
                              spreadRadius: 1,
                              offset: Offset(-20, -10),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.13),
                              blurRadius: 32,
                              spreadRadius: 1,
                              offset: const Offset(30, 20),
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(
                        60,
                            (index) => Transform.rotate(
                          angle: ((index) * 6 * pi) / 180,
                          child: (index % 5 == 0)
                              ? VerticalDivider(
                            indent: clockSize * 0.04,
                            endIndent: clockSize * 0.93,
                            width: 20,
                            thickness: 3,
                            color: Colors.grey,
                          )
                              : VerticalDivider(
                            indent: clockSize *0.04,
                            endIndent: clockSize * 0.92,
                            color: const Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                        width: 15,
                        decoration:
                        const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      ),
                      Transform.rotate(
                        angle: ((dateTime.hour + (dateTime.minute / 60)) * 30 * pi / 180),
                        child: VerticalDivider(
                          color: Colors.red,
                          indent: clockSize * 0.29,
                          endIndent: clockSize * 0.496,
                          thickness: 4,
                        ),
                      ),
                      Transform.rotate(
                        angle: (dateTime.minute * 6 * pi) / 180,
                        child: VerticalDivider(
                          color: Colors.blue,
                          indent: clockSize * 0.182,
                          endIndent: clockSize * 0.496,
                          thickness: 3,
                        ),
                      ),
                      Transform.rotate(
                        angle: (dateTime.second * 6 * pi) / 180,
                        child: VerticalDivider(
                          color: Colors.grey,
                          indent: clockSize * 0.12,
                          endIndent: clockSize * 0.496,
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
  }
}

SizedBox buildSizedBox() {
  return SizedBox(
    height: 320,
    width: 320,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(colors: [
              Color(0xFF1A1A1A),
              Color(0xFF121212),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            boxShadow: [
              const BoxShadow(
                color: Colors.black,
                blurRadius: 32,
                spreadRadius: 1,
                offset: Offset(-20, -10),
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.13),
                blurRadius: 32,
                spreadRadius: 1,
                offset: const Offset(30, 20),
              ),
            ],
          ),
        ),
        Container(
          height: 140,
          width: 140,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            shape: BoxShape.circle,
            gradient: const LinearGradient(colors: [
              Color(0xFF1A1A1A),
              Color(0xFF121212),
            ], begin: Alignment.topCenter, end: Alignment.bottomRight),
            boxShadow: [
              const BoxShadow(
                color: Colors.black,
                blurRadius: 32,
                spreadRadius: 1,
                offset: Offset(-20, -10),
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.13),
                blurRadius: 32,
                spreadRadius: 1,
                offset: const Offset(30, 20),
              ),
            ],
          ),
        ),
        ...List.generate(
          60,
          (index) => Transform.rotate(
            angle: ((index) * 6 * pi) / 180,
            child: (index % 5 == 0)
                ? const VerticalDivider(
                    indent: 10,
                    endIndent: 300,
                    width: 20,
                    thickness: 3,
                    color: Colors.grey,
                  )
                : const VerticalDivider(
                    endIndent: 400,
                    color: Color(0xFF1A1A1A),
                  ),
          ),
        ),
        Container(
          height: 15,
          width: 15,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        ),
        Transform.rotate(
          angle: ((dateTime.hour + (dateTime.minute / 60)) * 30 * pi / 180),
          child: const VerticalDivider(
            color: Colors.red,
            indent: 95,
            endIndent: 160,
            thickness: 4,
          ),
        ),
        Transform.rotate(
          angle: (dateTime.minute * 6 * pi) / 180,
          child: const VerticalDivider(
            color: Colors.blue,
            indent: 60,
            endIndent: 160,
            thickness: 3,
          ),
        ),
        Transform.rotate(
          angle: (dateTime.second * 6 * pi) / 180,
          child: const VerticalDivider(
            color: Colors.grey,
            indent: 30,
            endIndent: 160,
            thickness: 2,
          ),
        ),
      ],
    ),
  );
}

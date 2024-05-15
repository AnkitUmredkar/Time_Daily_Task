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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE3EDF7),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Clock',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: width * 0.55,
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE3EDF7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(2, 2),
                        ),
                        const BoxShadow(
                          color: Colors.white,
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 10,
                  ),
                  child: Container(
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
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFecf6ff),
                                  Color(0xFFcadbeb),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 32,
                                spreadRadius: 1,
                                offset: const Offset(30, 20),
                              ),
                              const BoxShadow(
                                color: Colors.white,
                                blurRadius: 32,
                                spreadRadius: 1,
                                offset: Offset(-20, -10),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 140,
                          width: 140,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3EDF7),
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFecf6ff),
                                  Color(0xFFcadbeb),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.white,
                                blurRadius: 32,
                                spreadRadius: 1,
                                offset: Offset(-20, -10),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
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
                                endIndent: 400, color: Color(0xFFE3EDF7)),
                          ),
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red
                          ),
                        ),
                        Transform.rotate(
                          angle: ((dateTime.hour + (dateTime.minute / 60)) * 30 * pi / 180),
                          child: const VerticalDivider(
                            color: Colors.red,
                            indent: 90,
                            endIndent: 160,
                            thickness: 4,
                          ),
                        ),
                        Transform.rotate(
                          angle: (dateTime.minute * 6 * pi ) / 180,
                          child: const VerticalDivider(
                            color: Colors.blue,
                            indent: 60,
                            endIndent: 160,
                            thickness: 3,
                          ),
                        ),
                        Transform.rotate(
                          angle: (dateTime.second * 6 * pi ) / 180,
                          child: const VerticalDivider(
                            color: Colors.grey,
                            indent: 30,
                            endIndent: 160,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
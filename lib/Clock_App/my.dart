import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'global.dart';

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

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double clockSize = min(width * 0.8, height * 0.4);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                AppBars(width, 'Clock'),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.all(height * 0.027),
                  child: buildContainer(clockSize),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Asia/Delhi',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Container(
                  height: height * 0.11,
                  width: width,
                  margin: EdgeInsets.only(
                      top: height * 0.07, left: 8, right: 8),
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: Offset(-4, -4),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.13),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gujarat',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.057),
                          ),
                          Text(
                            'Today',
                            style: TextStyle(
                                color: Colors.white60, fontSize: width * 0.042),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${(dateTime.hour > 12) ? (dateTime.hour % 12)
                                .toString()
                                .padLeft(2, '0') : (dateTime.hour)
                                .toString()
                                .padLeft(2, '0')} : ${(dateTime.minute)
                                .toString()
                                .padLeft(2, '0')}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.08,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height * 0.011),
                            child: Text(
                              (dateTime.hour > 12) ? 'PM' : 'AM',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/');
                      },
                      child: bottomButton(Icons.schedule_outlined, 1, 1),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/Timer');
                      },
                      child: bottomButton(Icons.timer_outlined, 2, 1),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: bottomButton(Icons.alarm_outlined, 3, 1),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: bottomButton(Icons.more_time_outlined, 4, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.022,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/global.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();
}

class _StrapWatchState extends State<StrapWatch> {
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
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          toolbarHeight: 85,
          title: const Text(
            'Strap Watch',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Digital',
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80, bottom: 100),
              height: 300,
              width: 300,
              child: CircularProgressIndicator(
                value: dateTime.second / 60,
                color: Colors.tealAccent,
                backgroundColor: const Color(0x1B73ADB6),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80, bottom: 100),
              height: 280,
              width: 280,
              child: CircularProgressIndicator(
                value: dateTime.minute / 60,
                color: Colors.teal,
                backgroundColor: const Color(0x1B73ADB6),
                strokeWidth: 4,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80, bottom: 100),
              height: 260,
              width: 260,
              child: CircularProgressIndicator(
                // value: ((dateTime.hour % 12) * 3600 +
                //         (dateTime.minute * 60) +
                //         dateTime.second) /
                //     (12 * 3600),
                value: ((dateTime.hour % 12 + dateTime.minute / 60) / 12),
                color: const Color(0xFF005854),
                backgroundColor: const Color(0x1B73ADB6),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${days[dateTime.weekday - 1]}  ${dateTime.day} ${month[dateTime.month - 1]}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Digital',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(dateTime.hour > 12) ? (dateTime.hour % 12).toString().padLeft(2, '0') : (dateTime.hour).toString().padLeft(2, '0')} : ${(dateTime.minute).toString().padLeft(2, '0')} : ${(dateTime.second).toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: 'Digital',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 22, left: 6),
                        child: Text(
                          (dateTime.hour > 12) ? 'PM' : 'AM',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Digital'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
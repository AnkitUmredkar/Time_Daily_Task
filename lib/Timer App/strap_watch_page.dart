import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/global.dart';

class StrapWatchPage extends StatefulWidget {
  const StrapWatchPage({super.key});

  @override
  State<StrapWatchPage> createState() => _StrapWatchPageState();
}

class _StrapWatchPageState extends State<StrapWatchPage> {
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
        backgroundColor: Colors.black87,
        body: Container(
          height: double.infinity,
          width: double.infinity,
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80, bottom: 100),
                height: 300,
                width: 300,
                child: CircularProgressIndicator(
                  value: dateTime.second / 60,
                  color: Colors.tealAccent,
                  backgroundColor: const Color(0x2C73ADB6),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80, bottom: 100),
                height: 280,
                width: 280,
                child: CircularProgressIndicator(
                  value: dateTime.minute / 60,
                  color: Colors.teal,
                  backgroundColor: const Color(0x2C73ADB6),
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
                  backgroundColor: const Color(0x2C73ADB6),
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

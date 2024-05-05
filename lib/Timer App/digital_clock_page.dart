import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_of_lecture/utils/global.dart';

class DigitalClockPage extends StatefulWidget {
  const DigitalClockPage({super.key});

  @override
  State<DigitalClockPage> createState() => _DigitalClockPageState();
}

class _DigitalClockPageState extends State<DigitalClockPage> {
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
              const SizedBox(height: 7),
              Text(
                '${days[dateTime.weekday - 1]}  ${dateTime.day} ${month[dateTime.month - 1]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
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

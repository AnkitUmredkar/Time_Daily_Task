import 'dart:math';
import 'package:flutter/material.dart';

DateTime dateTime = DateTime.now();
Color bgColor = const Color(0xFF1A1A1A);
int checkIndex = 1;
bool isStart = false,
    isPause = false;
List lapList = [];
String lapTime = '';

//todo--------------------> AppBar
Padding AppBars(double width, String data) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 9),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data,
          style: TextStyle(
              fontSize: width * 0.078,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        const Spacer(),
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
  );
}

//todo--------------------> Analogue Clock
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
              (index) =>
              Transform.rotate(
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
                  indent: clockSize * 0.04,
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
              (index) =>
              Transform.rotate(
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

//todo-------------------->BottomNavigation Bar
AnimatedContainer bottomButton(var icon, int pageIndex, int checkIndex) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 51,
    width: 51,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: bgColor,
      boxShadow: pageIndex == checkIndex
          ? null
          : [
        const BoxShadow(
          color: Colors.black,
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(-2, -2),
        ),
        BoxShadow(
          color: Colors.grey.shade800,
          blurRadius: 5,
          spreadRadius: 1,
          offset: const Offset(2, 2),
        ),
      ],
    ),
    child: Icon(
      icon,
      color: Colors.white,
    ),
  );
}

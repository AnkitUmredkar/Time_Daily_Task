import 'package:flutter/material.dart';

DateTime dateTime = DateTime.now();
late String day;

List days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

List img = [
  'assets/bg.jpg',
  'assets/bg2.jpg',
  'assets/bg3.avif',
];

int index = 0;
double second = 0;

List month = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

Column buildIconWithText({required IconData icon, required String data}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: Colors.grey,
      ),
      Text(
        data,
        style: const TextStyle(
          color: Colors.grey,
        ),
      )
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:practice_of_lecture/Practice/animated%20Search%20bar.dart';
import 'Practice/Chip/basic_chip.dart';
import 'Practice/dropdown_button.dart';
import 'Practice/flutter_button.dart';
import 'Practice/range_slider.dart';
import 'Practice/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Buttons(), //------> TODO Paste here
    );
  }
}

// TODO for Slider
//--->customSlider()
// TODO for RangeSlider
//--->customRangeSlider()
// TODO for DrpDownEffect
//--->dropdownEffect(
// TODO for DrpDownEffect
//--->dropdownEffect()
// TODO for Flutter Buttons
//--->Buttons()

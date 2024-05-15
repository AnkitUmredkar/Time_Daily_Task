import 'package:flutter/material.dart';
import 'package:practice_of_lecture/Practice/animated%20Search%20bar.dart';
import 'package:practice_of_lecture/Timer%20App/digital_clock_page.dart';
import 'package:practice_of_lecture/Timer_Daily_Task/digital_clock_app.dart';
import 'Practice/Chip/basic_chip.dart';
import 'Practice/dropdown_button.dart';
import 'Practice/my.dart';
import 'Timer App/analogue_clock_page.dart';
import 'Timer App/strap_watch_page.dart';
import 'Timer_Daily_Task/analog_clock_app.dart';
import 'Timer_Daily_Task/flutter_button.dart';
import 'Practice/range_slider.dart';
import 'Practice/slider.dart';
import 'Timer_Daily_Task/strapwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/': (context) => const DigitalClockPage(),
      //   '/AnalogueClock': (context) => const AnalogueClockPage(),
      //   '/StrapWatch': (context) => const StrapWatchPage(),
      // },
      home : MyClock(), //------> TODO Paste here
    );
  }
}

// TODO for Slider
//--->customSlider()
// TODO for RangeSlider
//--->customRangeSlider()
// TODO for DrpDownEffect
//--->dropdownEffect()
// TODO for DrpDownEffect
//--->dropdownEffect()
// TODO for Flutter Buttons
//--->Buttons()
// TODO for Digital Clock App
//--->DigitalClockApp()
// TODO for Analog Clock App
//--->AnalogClockApp()
// TODO for Strap Watch App
//--->StrapWatch()
// TODO for ORG Clock
//--->MyClock()

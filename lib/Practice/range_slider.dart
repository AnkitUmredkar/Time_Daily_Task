import 'package:flutter/material.dart';

class customRangeSlider extends StatefulWidget {
  const customRangeSlider({super.key});

  @override
  State<customRangeSlider> createState() => _customRangeSliderState();
}

class _customRangeSliderState extends State<customRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Practice',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: RangeSlider(
          min: 0,
          max: 100,
          divisions: 100,
          activeColor: Colors.blue,
          inactiveColor : Colors.blue.shade100,
          labels: RangeLabels(
              startRange.toInt().toString(), endRange.toInt().toString()),
          values: RangeValues(startRange, endRange),
          onChanged: (value) {
            setState(() {
              startRange = value.start;
              endRange = value.end;
            });
          },
        ),
      ),
    ));
  }
}

double startRange = 0;
double endRange = 100;

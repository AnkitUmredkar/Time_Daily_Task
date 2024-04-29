import 'package:flutter/material.dart';

class customSlider extends StatefulWidget {
  const customSlider({super.key});

  @override
  State<customSlider> createState() => _customSliderState();
}

class _customSliderState extends State<customSlider> {
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
        child: Slider(
            max: 100,
            label: SliderRange.toInt().toString(),
            divisions: 100,
            value: SliderRange,
            onChanged: (double value) {
              setState(() {
                SliderRange = value;
              });
            }),
      ),
    ));
  }
}

double SliderRange = 0;

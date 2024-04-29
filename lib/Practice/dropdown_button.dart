import 'package:flutter/material.dart';

class dropdownEffect extends StatefulWidget {
  const dropdownEffect({super.key});

  @override
  State<dropdownEffect> createState() => _dropdownEffectState();
}

class _dropdownEffectState extends State<dropdownEffect> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF12202F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF424242),
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Practice',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: DropdownButton(
          value: dropdownSelectedValue,
          icon: const Icon(Icons.menu),
          style: const TextStyle(color: Colors.white),
          dropdownColor: const Color(0xFF424242),
          elevation: 5,
          padding: const EdgeInsets.all(10),
          iconSize: 30,
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          items: const [
            DropdownMenuItem(
              value: 0,
              child: Text('Hello', style: TextStyle(fontSize: 20)),
            ),
            DropdownMenuItem<int>(
              value: 1,
              child: Text('surat', style: TextStyle(fontSize: 20)),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text('Ahmedabad', style: TextStyle(fontSize: 20)),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text('Vadodara', style: TextStyle(fontSize: 20)),
            ),
          ],
          onChanged: (value) {
            setState(() {
              dropdownSelectedValue = value!;
            });
          },
        ),
      ),
    ));
  }
}

int dropdownSelectedValue = 0;

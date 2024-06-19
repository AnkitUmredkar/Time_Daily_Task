import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 80,
          centerTitle: true,
          title: const Text(
            'Radio And CheckBox Example',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  }),
              RadioListTile(
                value: 'Male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                title: const Text('Male'),
                activeColor: Colors.blue,
              ),
              RadioListTile(
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                title: const Text('Female'),
              ),
              RadioListTile(
                value: 'Other',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                title: const Text('Other'),
                activeColor: Colors.blue,
              ),
              const SizedBox(height: 20),
              Checkbox(
                  value: read,
                  onChanged: (value) {
                    setState(() {
                      read = value!;
                    });
                  }),
              CheckboxListTile(
                value: read,
                onChanged: (value) {
                  setState(() {
                    read = value!;
                  });
                },
                title: const Text('Reading'),
                activeColor: Colors.blue,
              ),
              CheckboxListTile(
                value: play,
                onChanged: (value) {
                  setState(() {
                    play = value!;
                  });
                },
                title: const Text('Playing'),
                activeColor: Colors.blue,
              ),
              CheckboxListTile(
                value: dance,
                onChanged: (value) {
                  setState(() {
                    dance = value!;
                  });
                },
                title: const Text('Dancing'),
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String gender = 'Male';
bool read = false;
bool play = false;
bool dance = false;

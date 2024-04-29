import 'package:flutter/material.dart';

class BasicChip extends StatefulWidget {
  const BasicChip({super.key});

  @override
  State<BasicChip> createState() => _BasicChipState();
}

class _BasicChipState extends State<BasicChip> {
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Basic Chip Widget',
            style: TextStyle(fontSize: 25),
          ),
          Wrap(
            spacing: 7,
            children: [
              basicChipWidget(
                'F',
                'First',
              ),
              basicChipWidget('S', 'Second'),
              basicChipWidget('T', 'Third'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Action Chip Widget',
            style: TextStyle(fontSize: 25),
          ),
           ActionChip(
            label: const Text(
              "First Acton Chip",
              style: TextStyle(color: Colors.black),
            ),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
             ),
            backgroundColor: Colors.blue,
            avatar: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              final snackBar = SnackBar(content: Text('Hello Ankit Umredkar'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      )),
    ));
  }

  Chip basicChipWidget(String letter, String word) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          letter,
          style: TextStyle(color: Colors.white),
        ),
      ),
      label: Text(
        word,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.purple,
    );
  }
}

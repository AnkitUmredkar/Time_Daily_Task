import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';

class animatedSearchBar extends StatefulWidget {
  const animatedSearchBar({super.key});

  @override
  State<animatedSearchBar> createState() => _animatedSearchBarState();
}

class _animatedSearchBarState extends State<animatedSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: AnimatedSearchBar(
                height: 50,
                controller: TextEditingController(),
                cursorColor: Colors.grey,
                label: 'Search Item...',
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                searchDecoration: const InputDecoration(
                  fillColor: Colors.red,
                  suffixIconColor: Colors.white,
                  alignLabelWithHint: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

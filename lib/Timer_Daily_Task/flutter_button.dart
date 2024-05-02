import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
          child: Column(
            children: [
              const Text(
                'Common Buttons',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 305,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black87),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Elevate'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('+ icon'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFE8DEF8), // Change this color to whatever you want
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Elevate',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                          onPressed: () {},
                          child: const Text("Filled"),
                        ),
                        FilledButton(
                          onPressed: () {},
                          child: const Text("+ icon"),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFE8DEF8), // Change this color to whatever you want
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Filled",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFE8DEF8), // Change this color to whatever you want
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Filled Tonal',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFE8DEF8), // Change this color to whatever you want
                          ),
                          onPressed: () {},
                          child: const Text(
                            '+ icon',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFE8DEF8), // Change this color to whatever you want
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Filled Tonal',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Outlined',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            '+ icon',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              // Change this color to whatever you want
                              ),
                          onPressed: () {},
                          child: const Text(
                            'Outlined',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Text',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            '+ icon',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Text',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                'FloatingAction Buttons',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      width: 60, // Adjust width as needed
                      height: 60,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      width: 120, // Adjust width as needed
                      height: 60,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Text('+ Create'),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Icon Buttons',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.settings, color: Colors.black87),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart,
                          color: Colors.black87),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  const StatelessScreen({super.key});
  final int x = 10;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Start',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'This page won\'t do anything because of being "stateless".',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Center(
            child: Text(
              x.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x;
          // ignore: avoid_print
          print(x);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

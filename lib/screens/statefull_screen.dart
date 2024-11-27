import 'package:flutter/material.dart';

class StatefullScreen extends StatefulWidget {
  const StatefullScreen({super.key});

  @override
  State<StatefullScreen> createState() => _StatefullScreenState();
}

class _StatefullScreenState extends State<StatefullScreen> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statefull Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'This is a "Statefull" widget, hence changes it\'s "State".',
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
          x++;
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

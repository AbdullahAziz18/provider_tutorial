import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_tutorial/providers/count_provider.dart';

class CountExampleScreen extends StatefulWidget {
  const CountExampleScreen({super.key});

  @override
  State<CountExampleScreen> createState() => _CountExampleScreenState();
}

class _CountExampleScreenState extends State<CountExampleScreen> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 10), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example With Providers'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'This page shows the implementation of "Provider".',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              // ignore: avoid_print
              print('Only this widget is being built.');
              return Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 50),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

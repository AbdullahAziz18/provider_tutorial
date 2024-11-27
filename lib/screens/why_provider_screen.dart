import 'dart:async';

import 'package:flutter/material.dart';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int x = 0;
  Timer? _timer; // Declare the timer

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        // Check if the widget is still in the tree
        setState(() {
          x++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Built$x');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Why Provider Screen',
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
              'This page shows that why we should use "provider" rather than a "SetState".',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Center(
            child: Text(
              '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
              style: const TextStyle(fontSize: 50, color: Colors.indigoAccent),
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
    );
  }
}

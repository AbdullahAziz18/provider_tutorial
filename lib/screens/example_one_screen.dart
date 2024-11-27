import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_tutorial/providers/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One Provider'),
        backgroundColor: Colors.blue,
        centerTitle: true,
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
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
                activeColor: Colors.blue,
              );
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)),
                      child: const Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value)),
                      child: const Center(child: Text('Container 2')),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

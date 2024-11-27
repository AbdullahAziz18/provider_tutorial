import 'package:flutter/material.dart';

class ValueNotifyListnersScreen extends StatelessWidget {
  ValueNotifyListnersScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notifying'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'This page shows the implementation of Stateless Widget being a Statefull Widget.',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Center(
              child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                _counter.value.toString(),
                style: const TextStyle(fontSize: 50),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          // ignore: avoid_print
          print(_counter.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ValueNotifyListnersScreen2 extends StatelessWidget {
  ValueNotifyListnersScreen2({super.key});
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toogle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notifying 2'),
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
          const SizedBox(height: 10),
          ValueListenableBuilder(
            valueListenable: _toogle,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  obscureText: _toogle.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Password',
                    suffixIcon: InkWell(
                        onTap: () {
                          _toogle.value = !_toogle.value;
                        },
                        child: Icon(_toogle.value
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                ),
              );
            },
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
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

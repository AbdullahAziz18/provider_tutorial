import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_tutorial/providers/favourite_provider.dart';
import 'package:providers_tutorial/screens/favourite/myfavourite_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyfavouriteScreen(),
                ),
              );
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item ${index + 1}'),
                      trailing: value.selectedItems.contains(index)
                          ? const Icon(Icons.favorite_sharp)
                          : const Icon(Icons.favorite_border_sharp),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

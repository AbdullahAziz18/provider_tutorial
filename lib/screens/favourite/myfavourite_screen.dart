import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_tutorial/providers/favourite_provider.dart';

class MyfavouriteScreen extends StatefulWidget {
  const MyfavouriteScreen({super.key});

  @override
  State<MyfavouriteScreen> createState() => _MyfavouriteScreenState();
}

class _MyfavouriteScreenState extends State<MyfavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Items'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItems.length,
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

//The purpose of making this file is to learn about state management as well as providers.
//The whole project only has tutorial level codes or screens.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_tutorial/home_screen.dart';
import 'package:providers_tutorial/providers/count_provider.dart';
import 'package:providers_tutorial/providers/example_one_provider.dart';
import 'package:providers_tutorial/providers/favourite_provider.dart';
import 'package:providers_tutorial/providers/theme_changer_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                iconTheme: const IconThemeData(color: Colors.red)),
          );
        },
      ),
    );
  }
}

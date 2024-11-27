import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_tutorial/providers/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChangerProvider>(context);
    // ignore: avoid_print
    print('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Theme'),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
          const Icon(Icons.favorite),
          const Center(
            child: Text(
              'This page shows the implementation of "Provider".',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

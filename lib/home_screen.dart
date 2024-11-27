import 'package:flutter/material.dart';
import 'package:providers_tutorial/screens/count_example_screen.dart';
import 'package:providers_tutorial/screens/dark_theme_screen.dart';
import 'package:providers_tutorial/screens/example_one_screen.dart';
import 'package:providers_tutorial/screens/favourite/favourite_screen.dart';
import 'package:providers_tutorial/screens/statefull_screen.dart';
import 'package:providers_tutorial/screens/stateless_screen.dart';
import 'package:providers_tutorial/screens/value_notify_listners_screen.dart';
import 'package:providers_tutorial/screens/value_notify_listners_screen2.dart';
import 'package:providers_tutorial/screens/why_provider_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steps for Knowledge'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color(0xfff2f2f2),
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Following is the step by step understanding of State Management.',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 20),
            pageRouteButton(
                const StatelessScreen(), 'Stateless Widget Example'),
            const SizedBox(height: 20),
            pageRouteButton(
                const StatefullScreen(), 'Statefull Widget Example'),
            const SizedBox(height: 20),
            pageRouteButton(
                const WhyProviderScreen(), 'Why User Provider Example'),
            const SizedBox(height: 20),
            pageRouteButton(
                const ExampleOneScreen(), 'Provider Examples 1 Example'),
            const SizedBox(height: 20),
            pageRouteButton(const CountExampleScreen(), 'Count Example'),
            const SizedBox(height: 20),
            pageRouteButton(const FavouriteScreen(), 'Favourite Example'),
            const SizedBox(height: 20),
            pageRouteButton(const DarkThemeScreen(), 'Dark Theme Example'),
            const SizedBox(height: 20),
            pageRouteButton(
                ValueNotifyListnersScreen(), 'Value Notifier 1 Example'),
            const SizedBox(height: 20),
            pageRouteButton(
                ValueNotifyListnersScreen2(), 'Value Notifier 2 Example'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

pageRouteButton(var page, String name) {
  return Builder(
    builder: (BuildContext context) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text(name)),
            ),
          ),
        ),
      );
    },
  );
}

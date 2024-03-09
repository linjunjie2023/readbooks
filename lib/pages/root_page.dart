import 'package:flutter/material.dart';
import 'package:readbook/theme/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:readbook/json/root_app_json.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    return SalomonBottomBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        selectedItemColor: primary,
        items: List.generate(rootAppJson.length, (index) {
          return SalomonBottomBarItem(
            icon: Icon(rootAppJson[index]['icon']),
            title: Text(rootAppJson[index]['text']),
          );
        }));
  }
}

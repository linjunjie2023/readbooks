import 'package:flutter/material.dart';
import 'package:readbook/theme/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:readbook/json/root_app_json.dart';
import 'package:readbook/pages/home_page.dart';

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
      body: getBody(),
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

  Widget getBody() {
    //根据当前选中的索引显示不同的子组件。
    return IndexedStack(index: pageIndex, children: [
      HomePage(),
      Center(
          child: Text('书架',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      Center(
          child: Text('书城',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      Center(
          child: Text('设置',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
    ]);
  }
}

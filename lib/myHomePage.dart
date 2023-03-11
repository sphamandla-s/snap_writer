
import 'package:docs/screens/document.dart';
import 'package:docs/screens/settings.dart';
import 'package:docs/screens/simpifly.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentPageIndex = 0;

  void _selected(int index){
    setState(() {
      _currentPageIndex = index;
    });
  }

  List pages = [
    const Documents(),
    const Simplify(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Read'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentPageIndex,
        onTap: _selected,
      ),
      body: pages[_currentPageIndex],
    );
  }
}

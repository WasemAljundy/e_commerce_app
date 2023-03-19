import 'package:flutter/material.dart';
import 'package:ui_app/models/bn_screen.dart';
import 'package:ui_app/screens/bn_screens/articles_screen.dart';
import 'package:ui_app/screens/bn_screens/favourite_screen.dart';
import 'package:ui_app/screens/bn_screens/home_screen.dart';
import 'package:ui_app/screens/bn_screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<BnScreen> bnScreens = [
    const BnScreen(
      title: 'Home',
      widget: HomeScreen(),
    ),
    const BnScreen(
      title: 'Favourite',
      widget: FavouriteScreen(),
    ),
    const BnScreen(
      title: 'Articles',
      widget: ArticlesScreen(),
    ),
    const BnScreen(
      title: 'Settings',
      widget: SettingsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bnScreens[_currentIndex].title),
        centerTitle: true,
      ),
      body: bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
            label: 'Favourite',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article),
            label: 'Articles',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_app/models/bn_screen.dart';
import 'package:ui_app/prefs/shared_pref_controller.dart';
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
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.blue.shade700,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/wasem.jpg'),
                ),
              ),
              accountName: const Text('Wasem Aljundy'),
              accountEmail: const Text('wasemaljundy22@gmail.com'),
              otherAccountsPictures: const [
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
              ],
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/info_screen'),
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              subtitle: const Text('Info About App'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/faqs_screen'),
              leading: const Icon(Icons.question_answer_rounded),
              title: const Text('FAQs'),
              subtitle: const Text('Frequently Asked Question'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
            const Divider(
              thickness: 2,
              indent: 25,
              endIndent: 25,
            ),
            ListTile(
              onTap: () async {
                await SharedPrefController().logout();
                Navigator.pushReplacementNamed(context, '/login_screen');
                // Future.delayed(
                //   const Duration(milliseconds: 400),
                //   () => Navigator.pushNamedAndRemoveUntil(
                //       context, '/login_screen', (route) => false),
                // );
                // Navigator.
              },
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('See You Soon ✨'),
            ),
          ],
        ),
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

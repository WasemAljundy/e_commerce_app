import 'package:flutter/material.dart';
import 'package:ui_app/screens/drawer_screens/faqs/general_questions_screen.dart';
import 'package:ui_app/screens/drawer_screens/faqs/usage_questions_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
           const CircleAvatar(
            radius: 100,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 99,
              backgroundImage: AssetImage('images/user.jpg'),
            ),
          ),
          const SizedBox(height: 10),
          TabBar(
            onTap: (int value) => setState(
              () {
                _selectedTab = value;
              },
            ),
            controller: _tabController,
            labelColor: Colors.blue,
            tabs: const [
              Tab(text: 'App'),
              Tab(text: 'Company'),
            ],
          ),
          IndexedStack(
            index: _selectedTab,
            children: [
              Visibility(
                visible: _selectedTab == 0,
                child: const GeneralQuestionsScreen(),
              ),
              Visibility(
                visible: _selectedTab == 1,
                child: const UsageQuestionsScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/out_boarding_content.dart';
import '../widgets/out_boarding_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentPage < 2,
              replacement: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login_screen'),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () => _pageController.animateToPage(2, duration: const Duration(seconds: 1), curve: Curves.easeOutCubic),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 0,
              maxWidth: double.infinity,
              minHeight: 0,
              maxHeight: 500,
            ),
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                _currentPage = value;
              }),
              children: const [
                OutBoardingContent(),
                OutBoardingContent(),
                OutBoardingContent(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: _currentPage == 0 ? false : true,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: IconButton(
                  onPressed: () => _pageController.previousPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInOut),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: _currentPage == 0 ? Colors.grey : Colors.black,
                  ),
                ),
              ),
              Visibility(
                visible: _currentPage == 2 ? false : true,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: IconButton(
                  onPressed: () => _pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeIn),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutBoardingIndicator(selected: _currentPage == 0),
              OutBoardingIndicator(selected: _currentPage == 1),
              OutBoardingIndicator(selected: _currentPage == 2),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: _currentPage == 2,
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            child: ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login_screen'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('START'),
            ),
          ),
        ],
      ),
    );
  }
}

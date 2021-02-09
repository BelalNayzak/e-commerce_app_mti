import 'package:flutter/material.dart';
import 'package:mti_app/screens/Pages/cart_page.dart';
import 'package:mti_app/screens/Pages/home_page.dart';
import 'package:mti_app/screens/Pages/profile_page.dart';
import 'package:mti_app/widgets/my_bottom_app_bar.dart';

// resources:
// (bottom app bar implementations and examples)
// https://o7planning.org/12863/flutter-bottomappbar
// https://stackoverflow.com/questions/54622602/how-to-use-a-bottomappbar-for-navigation-in-flutter

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 1);
  int _currentPageIndex = 1;

  void _indicateSelection(int index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        pageController: _pageController,
        currentPageIndex: _currentPageIndex,
        onPressIcon: _indicateSelection,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _indicateSelection(index);
        },
        children: [
          Center(child: Text('wish list')),
          HomePage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            _currentPageIndex == 1 ? Colors.grey[800] : Colors.white,
        // _currentPageIndex == 1 ? Colors.red : Colors.white,
        child: Icon(
          Icons.home_outlined,
          color: _currentPageIndex == 1 ? Colors.white : Colors.grey[700],
          // color: _currentPageIndex == 1 ? Colors.white : Colors.red[200],
        ),
        onPressed: () => _indicateSelection(1),
      ),
    );
  }
}

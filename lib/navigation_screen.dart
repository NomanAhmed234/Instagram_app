import 'package:flutter/material.dart';
import 'package:instagram_clone/add_screen.dart';
import 'package:instagram_clone/explore_screen.dart';
import 'package:instagram_clone/home_screen.dart';
import 'package:instagram_clone/profileScreen.dart';
import 'package:instagram_clone/reels_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late PageController pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: navigationTapped,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.camera), label: ''),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('images/reels.png'),
                  size: 24,
                ),
                label: '',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ]),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(),
          ExploreScreen(),
          AddScreen(),
          ReelScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}

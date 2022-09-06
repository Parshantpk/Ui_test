import 'package:flutter/material.dart';
import 'package:ui_test/home_page.dart';
import 'package:ui_test/me_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  _getScreen(int pos) {
    switch (pos) {
      case 0:
        return const HomePage();
      case 1:
        return const MeScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            colors: [
              Colors.white,
              Color(0xFFFBE9E7),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _currentIndex,
            selectedItemColor: const Color(0xFFFF6F43),
            unselectedItemColor: const Color(0xDE000000),
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Cats'),
              BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Me'),
            ],
          ),
        ),
      ),
      body: _getScreen(_currentIndex),
    );
  }
}

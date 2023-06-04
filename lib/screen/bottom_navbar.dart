import 'package:flutter/material.dart';
import 'package:gift2grow/screen/donate_to_app.dart';
import 'package:gift2grow/screen/home.dart';
import 'package:gift2grow/screen/profile_page.dart';
import 'package:gift2grow/screen/ranking_pagee.dart';

class MyBottomNavbar extends StatefulWidget {
  const MyBottomNavbar({super.key});

  @override
  State<MyBottomNavbar> createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int _selectedScreen = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RankingPage(),
    DonateToApp(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedScreen),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4), // Shadow color
                blurRadius: 10.0, // Spread radius
                offset: const Offset(0, 6), // Shadow offset
              ),
            ],
          ),
          child: BottomNavigationBar(
            // backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage("assets/icon/ranking-3.png"),
                  width: 30,
                  height: 30,
                ),
                label: "Ranking",
                activeIcon: Image(
                  image: AssetImage("assets/icon/ranking-4.png"),
                  width: 30,
                  height: 30,
                ),
              ),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage("assets/icon/gift.png"),
                    width: 30,
                    height: 30,
                  ),
                  label: "Donate",
                  activeIcon: Image(
                    image: AssetImage("assets/icon/gift-2.png"),
                    width: 30,
                    height: 30,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: "Profile",
                  activeIcon: Icon(Icons.person)),
            ],
            currentIndex: _selectedScreen,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            onTap: _onItemTapped,
            iconSize: 35,
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
        ));
  }
}

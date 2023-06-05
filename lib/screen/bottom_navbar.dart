import 'package:flutter/material.dart';
import 'package:gift2grow/screen/Ranking.dart';
import 'package:gift2grow/screen/donate_to_app.dart';
import 'package:gift2grow/screen/home.dart';
import 'package:gift2grow/screen/profile_page.dart';
import 'package:gift2grow/screen/ranking_pagee.dart';

class MyBottomNavbar extends StatefulWidget {
  const MyBottomNavbar({
    super.key,
    required this.screen,
  });
  final int screen;

  @override
  State<MyBottomNavbar> createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int _selectedScreen = 0;
  @override
  void initState() {
    super.initState();
    _selectedScreen = widget.screen;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RankPage(),
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
                icon: Image(
                  image: AssetImage("assets/icon/home-2.png"),
                  width: 25,
                  height: 25,
                ),
                label: "Home",
                activeIcon: Image(
                  image: AssetImage("assets/icon/home-3.png"),
                  width: 25,
                  height: 25,
                ),
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
                icon: Image(
                  image: AssetImage("assets/icon/user.png"),
                  width: 25,
                  height: 25,
                ),
                label: "Profile",
                activeIcon: Image(
                  image: AssetImage("assets/icon/user-2.png"),
                  width: 25,
                  height: 25,
                ),
              )
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

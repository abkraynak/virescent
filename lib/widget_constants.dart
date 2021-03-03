import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'account.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

List<Widget> _navScreens(){
  return [
    //HomeScreen(),
    //LocationsScreen(),
    Account()
  ];
}

List<PersistentBottomNavBarItem> _navBarItems(){
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: 'Home',
      activeColor: Colors.green,
      inactiveColor: Colors.blueGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.map),
      title: 'Locations',
      activeColor: Colors.green,
      inactiveColor: Colors.blueGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.account_circle),
      title: 'Account',
      activeColor: Colors.green,
      inactiveColor: Colors.blueGrey,
    ),
  ];
}

BottomNavigationBar kBottomBar = BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(

      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'Locations',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Account',
    ),
  ],
  currentIndex: 2,
  selectedItemColor: Colors.green,
);

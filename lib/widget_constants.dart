import 'package:flutter/material.dart';

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

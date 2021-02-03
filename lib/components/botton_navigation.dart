import 'package:flutter/material.dart';

class MyNavigation extends StatelessWidget {
  const MyNavigation({
    Key key,
    @required int selectedIndex,
    @required this.onItemTapped,
  }) : _selectedIndex = selectedIndex, super(key: key);

  final int _selectedIndex;
  final Function onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Darot',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.backpack,
          ),
          label: 'My courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: 'Menu',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}
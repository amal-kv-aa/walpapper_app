
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded,color: Colors.blue,), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
         
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (newIndex) {
         
        },
      );
  }
}
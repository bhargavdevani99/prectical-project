import 'package:demo_structure/config/app_colors.dart';
import 'package:demo_structure/view/profile_screen/profile_screen.dart';
import 'package:demo_structure/view/tabs/dashboard_tab/dashboard_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List itemList = [
    const DashboardScreen(),
    const Center(child: Text('Favourite')),
    const Center(child: Text('Cart')),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: itemList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: AppColors.whiteColor,
        selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.greyColor),
            label: "",
            activeIcon: Icon(Icons.home, color: AppColors.primaryColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: AppColors.greyColor),
            label: "",
            activeIcon: Icon(Icons.category, color: AppColors.primaryColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: AppColors.greyColor),
            label: "",
            activeIcon: Icon(Icons.bookmark, color: AppColors.primaryColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColors.greyColor),
            label: "",
            activeIcon: Icon(Icons.person, color: AppColors.primaryColor),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        selectedItemColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

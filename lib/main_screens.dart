import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens/home_page.dart';
import 'package:mentor_connect/main_screens/mentor_page.dart';
import 'package:mentor_connect/main_screens/profile_page.dart';
import 'package:mentor_connect/main_screens/freelance_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MentorPage(),
    FreelancePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary, // Set selected icon color
        unselectedItemColor: Theme.of(context).colorScheme.primary, // Set unselected icon color
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 12.0, height: 17 / 12),
        selectedLabelStyle: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 12.0, height: 17 / 12),
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: AppSVGIcon(iconPath: IconPaths.home, size: 18.0),
            activeIcon: AppSVGIcon(iconPath: IconPaths.home1, size: 18.0),
          ),
          const BottomNavigationBarItem(
            icon: AppSVGIcon(iconPath: IconPaths.employeeManAlt, size: 18.0),
            activeIcon: AppSVGIcon(iconPath: IconPaths.employeeManAlt1, size: 18.0),
            label: 'Mentor',
          ),
          const BottomNavigationBarItem(
            label: 'Freelance',
            icon: AppSVGIcon(iconPath: IconPaths.briefcase, size: 18.0),
            activeIcon: AppSVGIcon(iconPath: IconPaths.briefcase1, size: 18.0),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: const CircleAvatar(backgroundImage: AssetImage(ImagePaths.image2), radius: 12),
            activeIcon: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(100)),
                child: const CircleAvatar(backgroundImage: AssetImage(ImagePaths.image2), radius: 12)),
          ),
        ],
      ),
      // bottomNavigationBar: NavigationBar(

      //   destinations: const [
      //     Column(
      //       children: [
      //         NavigationDestination(icon: AppSVGIcon(iconPath: IconPaths.briefcase, size: 18.0), label: 'Home'),
      //         NavigationDestination(icon: AppSVGIcon(iconPath: IconPaths.briefcase, size: 18.0), label: 'Home'),
      //         NavigationDestination(icon: AppSVGIcon(iconPath: IconPaths.briefcase, size: 18.0), label: 'Home'),
      //         NavigationDestination(icon: AppSVGIcon(iconPath: IconPaths.briefcase, size: 18.0), label: 'Home'),
      //       ],
      //     )
      //   ],
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.search),
      // ),
    );
  }
}

// _________


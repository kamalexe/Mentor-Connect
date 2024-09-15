import 'package:flutter/material.dart';
import 'package:mentor_connect/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens/home_page.dart';
import 'package:mentor_connect/main_screens/mentor_page.dart';
import 'package:mentor_connect/main_screens/profile_page.dart';
import 'package:mentor_connect/main_screens/university_page.dart';

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
            icon: AppSVGIcon(iconPath: IconPaths.home, size: 24.0),
            activeIcon: AppSVGIcon(iconPath: IconPaths.home1, size: 24.0),
          ),
          const BottomNavigationBarItem(
            icon: AppSVGIcon(iconPath: IconPaths.employeeManAlt, size: 24.0),
            activeIcon: AppSVGIcon(iconPath: IconPaths.employeeManAlt1, size: 24.0),
            label: 'Mentor',
          ),
          const BottomNavigationBarItem(
            label: 'Freelance',
            icon: AppSVGIcon(iconPath: IconPaths.briefcase, size: 24.0),
            activeIcon: AppSVGIcon(iconPath: IconPaths.briefcase, size: 24.0),
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
    );
  }
}

// _________

class UniversityEventModel {
  final String universityName;
  final String postImage;
  final String universityLogo;
  final String postDate;
  final String eventTime;
  final String eventDate;

  UniversityEventModel({
    required this.universityName,
    required this.postImage,
    required this.universityLogo,
    required this.postDate,
    required this.eventTime,
    required this.eventDate,
  });
}

final List<UniversityEventModel> universityEvents = [
  UniversityEventModel(
    universityName: 'Punjab University',
    postImage: ImagePaths.liveWebinar,
    universityLogo: ImagePaths.panjabUniv,
    postDate: '2 days ago',
    eventTime: '10:30 - 12:00 PM',
    eventDate: '24 Aug, 2024 - Monday',
  ),
  UniversityEventModel(
    universityName: 'IIT Kanpur',
    postImage: ImagePaths.liveWebinar2,
    universityLogo: ImagePaths.images1,
    postDate: '5 days ago',
    eventTime: '11:00 - 01:00 PM',
    eventDate: '20 Aug, 2024 - Friday',
  ),
  UniversityEventModel(
    universityName: 'IIT Bombay',
    postImage: ImagePaths.image2,
    universityLogo: ImagePaths.channelsProfile,
    postDate: '1 week ago',
    eventTime: '09:00 - 11:30 AM',
    eventDate: '18 Aug, 2024 - Wednesday',
  ),
  UniversityEventModel(
    universityName: 'Harvard University',
    postImage: ImagePaths.tap,
    universityLogo: ImagePaths.channelsProfile,
    postDate: '3 days ago',
    eventTime: '02:00 - 03:30 PM',
    eventDate: '22 Aug, 2024 - Thursday',
  ),
  UniversityEventModel(
    universityName: 'Stanford University',
    postImage: ImagePaths.maxResDefault,
    universityLogo: ImagePaths.bennettLogo,
    postDate: '4 days ago',
    eventTime: '12:00 - 01:30 PM',
    eventDate: '23 Aug, 2024 - Friday',
  ),
];

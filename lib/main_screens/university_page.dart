import 'package:flutter/material.dart';
import 'package:mentor_connect/main_screens/home_page.dart';

class FreelancePage extends StatefulWidget {
  const FreelancePage({super.key});

  @override
  FreelancePageState createState() => FreelancePageState();
}

class FreelancePageState extends State<FreelancePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text('Freelance Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

//

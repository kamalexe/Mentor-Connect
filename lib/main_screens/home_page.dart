import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/demo_data.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens/mentor_page.dart';
import 'package:mentor_connect/sign_up_screen.dart';
import 'package:mentor_connect/theme/app_widget.dart';
import 'package:mentor_connect/webinar_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _showSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0, top: 3),
          child: Row(
            children: [
              Text('Events', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
              const SizedBox(width: 16),
              AppBarSearchBar(
                hint: 'Event',
                onTap: () {
                  _showSearch(context);
                },
              )
            ],
          ),
        ),
        actions: [NotificationIcon(onTap: () {}), const SizedBox(width: 16)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(height: 1),
            ListView.separated(
              shrinkWrap: true, // Allows it to work within other scrollable widgets
              itemCount: universityEvents.length,
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final event = universityEvents[index];
                return UniversityEvent(event: event);
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}

// ___________
class UniversityEvent extends StatelessWidget {
  final UniversityEventModel event;
  const UniversityEvent({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 20, backgroundColor: Theme.of(context).colorScheme.onPrimary, backgroundImage: AssetImage(event.universityLogo)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      event.universityName,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: colorScheme.primary),
                    ),
                    Text(
                      event.postDate,
                      style: TextStyle(fontSize: 10, color: colorScheme.outline, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert_rounded, size: 18, color: colorScheme.primary)
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Image.asset(event.postImage, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 7),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.eventDate,
                      style: TextStyle(fontSize: 12, color: colorScheme.outline),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.eventTime,
                      style: TextStyle(fontSize: 12, color: colorScheme.outline),
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WebinarScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.primary,
                      boxShadow: const [BoxShadow(color: Color(0xFFC3C4FF), blurRadius: 2, offset: Offset(0, 2))],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                    child: const Text(
                      'Attend',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ----------------------

// -----------------

class NotificationIcon extends StatelessWidget {
  final Function()? onTap;
  const NotificationIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: SizedBox(
          height: 36,
          width: 36,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const AppSVGIcon(iconPath: IconPaths.bell),
              Positioned(
                right: 0,
                top: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(100), color: Colors.red),
                    ),
                    const Text('2', style: TextStyle(fontSize: 10, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<UniversityEventModel> suggestions = universityEvents.where((event) {
      return event.universityName.toLowerCase().contains(query.toLowerCase()) ||
          event.postDate.toLowerCase().contains(query.toLowerCase()) ||
          event.eventTime.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final UniversityEventModel suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.universityName),
          subtitle: Text(suggestion.eventDate),
          leading: CircleAvatar(backgroundImage: AssetImage(suggestion.universityLogo)),
          onTap: () {
            query = suggestion.universityName;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<UniversityEventModel> results = universityEvents.where((event) {
      return event.universityName.toLowerCase().contains(query.toLowerCase()) ||
          event.postDate.toLowerCase().contains(query.toLowerCase()) ||
          event.eventTime.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        itemCount: results.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => UniversityEvent(event: results[index]),
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear, size: 18),
        onPressed: () => query = '',
      ),
    ];
  }
}

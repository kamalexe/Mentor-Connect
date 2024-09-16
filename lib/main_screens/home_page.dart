import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/demo_data.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens/mentor_page.dart';
import 'package:mentor_connect/webinar_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Row(
          children: [
            Text(
              'Events',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            const AppBarSearchBar(hint: 'Event')
          ],
        ),
        actions: [
          NotificationIcon(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
            },
          ),
          SizedBox(width: 16)
        ],
      ),
      body: ListView.separated(
        shrinkWrap: true, // Allows it to work within other scrollable widgets
        itemCount: universityEvents.length,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        itemBuilder: (context, index) {
          final event = universityEvents[index];
          return UniversityEvent(
            universityName: event.universityName,
            postImage: event.postImage,
            universityLogo: event.universityLogo,
            postDate: event.postDate,
            eventTime: event.eventTime,
            eventDate: event.eventDate,
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

// ___________
class UniversityEvent extends StatelessWidget {
  final String universityName;
  final String postDate;
  final String postImage;
  final String universityLogo;
  final String eventDate;
  final String eventTime;
  const UniversityEvent(
      {super.key,
      required this.universityName,
      required this.universityLogo,
      required this.eventDate,
      required this.eventTime,
      required this.postDate,
      required this.postImage});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
              radius: 20, backgroundColor: Theme.of(context).colorScheme.onPrimary, backgroundImage: AssetImage(universityLogo)),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          title: Text(
            universityName,
            style: TextStyle(fontSize: 13, fontFamily: 'Poppins', fontWeight: FontWeight.w600, color: colorScheme.primary),
          ),
          subtitle: Text(
            '$postDate\n',
            style: TextStyle(fontSize: 10, fontFamily: 'Poppins', color: colorScheme.outline, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(Icons.more_vert_rounded, size: 18, color: colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(),
          child: Image.asset(postImage, fit: BoxFit.cover),
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
                    eventDate,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: colorScheme.outline),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    eventTime,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: colorScheme.outline),
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
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

// ----------------------

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final List<Widget>? actions;
  const MyAppBar({super.key, this.title, this.actions, this.leading, this.leadingWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leadingWidth: leadingWidth,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      leading: leading,
      elevation: 2,
      actions: actions,
      centerTitle: false,
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

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

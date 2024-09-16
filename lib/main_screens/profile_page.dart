import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final List<Tab> myTabs = <Tab>[
      const Tab(child: Text('OverView')),
      const Tab(child: Text('Testimonials', style: TextStyle(fontSize: 10))),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 2,
          centerTitle: false,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorScheme.primary),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(124),
            child: Column(
              children: [
                const UserProfileAppBar(),
                TabBar.secondary(
                  labelStyle: TextStyle(fontSize: 10, color: colorScheme.primary),
                  unselectedLabelColor: colorScheme.outlineVariant,
                  tabs: myTabs,
                ),
              ],
            ),
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutWidget(),
              SizedBox(height: 8),
              ExperienceListWidget(),
              SizedBox(height: 48),
              SwitchModeButton(iconPath: IconPaths.employeeManAlt, title: 'Become a Mentor'),
              SizedBox(height: 15),
              SwitchModeButton(iconPath: IconPaths.briefcase, title: 'Hire a freelance'),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchModeButton extends StatelessWidget {
  final String iconPath;
  final String title;
  const SwitchModeButton({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: colorScheme.primaryContainer),
          child: Center(child: AppSVGIcon(iconPath: iconPath, size: 20)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorScheme.primaryContainer),
            child: Text(title, style: const TextStyle(fontSize: 10)),
          ),
        )
      ],
    );
  }
}

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('About', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)), AppIconButtonFilled(icon: Icons.edit)],
        ),
        Padding(
          padding: EdgeInsets.only(right: 80.0),
          child: Text('Building @Tayyari | Ex-Microsoft | 400k+ Subs on YT | NSIT', style: TextStyle(fontSize: 12)),
        )
      ],
    );
  }
}

class ExperienceListWidget extends StatelessWidget {
  const ExperienceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Experience', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            AppIconButtonFilled(icon: Icons.edit)
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(height: 20),
          itemCount: demoExperiences.length,
          itemBuilder: (context, index) => ExperienceWidget(
            experience: demoExperiences[index],
          ),
        ),
      ],
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceWidget({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(experience.logoPath, height: 28, width: 28, fit: BoxFit.cover),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience.role,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              Text(
                experience.duration,
                style: TextStyle(fontSize: 10, color: colorScheme.outline),
              ),
              Text(
                experience.location,
                style: TextStyle(fontSize: 10, color: colorScheme.outline),
              ),
              const SizedBox(height: 12),
              Text(
                experience.description,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UserProfileAppBar extends StatelessWidget {
  const UserProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 86,
          child: Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(ImagePaths.image1, height: 74, width: 74, fit: BoxFit.fill)),
                  ),
                  Positioned(top: 0, right: 0, child: Image.asset(ImagePaths.verify1, height: 24))
                ],
              ),
              const SizedBox(width: 6),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nishant Chahar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.primary)),
                  Text('SDE at Microsoft', style: TextStyle(fontSize: 10, color: colorScheme.outlineVariant)),
                ],
              ),
            ],
          ),
        ),
        const Positioned(right: 10, child: AppIconButtonFilled(icon: Icons.edit))
      ],
    );
  }
}

class AppIconButtonFilled extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const AppIconButtonFilled({super.key, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton.filled(
        style:
            ButtonStyle(visualDensity: VisualDensity.compact, backgroundColor: WidgetStatePropertyAll<Color>(colorScheme.primaryContainer)),
        onPressed: onPressed,
        icon: Icon(icon, color: colorScheme.primary, size: 16));
  }
}

class ExperienceModel {
  final String company;
  final String logoPath;
  final String role;
  final String duration;
  final String location;
  final String description;

  ExperienceModel({
    required this.company,
    required this.logoPath,
    required this.role,
    required this.duration,
    required this.location,
    required this.description,
  });
}

// Demo Data
final List<ExperienceModel> demoExperiences = [
  ExperienceModel(
    company: 'Tech Corp',
    logoPath: ImagePaths.company1,
    role: 'Software Engineer',
    duration: '2022 - 2024',
    location: 'Bangalore, Karnataka',
    description: 'Working on Live Persona Editor (LPE) and Live Persona Card (LPC) for Microsoft Teams and Outlook.',
  ),
  ExperienceModel(
    company: 'Data Systems Inc.',
    logoPath: ImagePaths.company2,
    role: 'Co-Founder',
    duration: '2020 - 2022',
    location: 'Mumbai, Maharashtra',
    description: 'Developed and maintained data pipelines for real-time analytics dashboards.',
  ),
];

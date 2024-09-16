import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/demo_data.dart';
import 'package:mentor_connect/theme/app_widget.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/mentor_ship_detail_view.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({super.key});

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  // Track the selected chip index
  int _selectedIndex = 0;

  // List of chip labels
  final List<String> _chipLabels = [
    'Carrier guidance',
    'Interview',
    'Business growth',
    'StartUp',
  ];

  void onSelected(index, selected) {
    setState(() {
      _selectedIndex = selected ? index : _selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Row(
          children: [AppBarSearchBar(hint: 'Name/Profession'), SizedBox(width: 12), FilterButton()],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: SizedBox(
            height: 44,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              scrollDirection: Axis.horizontal,
              itemCount: _chipLabels.length,
              itemBuilder: (context, index) => MyChoiceChip(
                label: _chipLabels[index],
                isSelected: _selectedIndex == index,
                onSelected: (selected) => onSelected(index, selected),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: demoMentors.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 12),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemBuilder: (context, index) => MentorCard(mentor: demoMentors[index]),
              ),
              const SizedBox(height: 75),
              const RefreshButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppSVGIcon(iconPath: IconPaths.rotateRight, size: 10),
          const SizedBox(width: 3),
          Text(
            'More',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}

class MentorCard extends StatelessWidget {
  final Function()? onTap;
  final MentorModel mentor;
  const MentorCard({super.key, this.onTap, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MentorShipDetailView(mentor: mentor)));
        // onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(radius: 24, backgroundImage: AssetImage(mentor.profileImagePath)),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      mentor.name,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      mentor.title,
                      style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.outline),
                    ),
                    Row(
                      children: [
                        const AppSVGIcon(iconPath: IconPaths.star, color: Color(0XFFE68D24), size: 14),
                        const SizedBox(width: 4),
                        Text(mentor.rating, style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurface)),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            Text(
              mentor.description,
              style: const TextStyle(fontSize: 10, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

class AppBarSearchBar extends StatelessWidget {
  final Function()? onTap;
  final String? hint;

  const AppBarSearchBar({super.key, this.onTap, this.hint});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              const AppSVGIcon(iconPath: IconPaths.search, size: 18),
              const SizedBox(width: 8),
              Container(
                height: 25,
                width: 1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.outlineVariant),
              ),
              const SizedBox(width: 8),
              Text(
                hint ?? 'Search',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(5)),
      child: const AppSVGIcon(iconPath: IconPaths.settingsSliders, color: Colors.white, size: 20),
    );
  }
}


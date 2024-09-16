import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/demo_data.dart';
import 'package:mentor_connect/theme/app_widget.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens/mentor_page.dart';

class FreelancePage extends StatefulWidget {
  const FreelancePage({super.key});

  @override
  FreelancePageState createState() => FreelancePageState();
}

class FreelancePageState extends State<FreelancePage> {
  // Track the selected chip index
  int _selectedIndex = 0;

  // List of chip labels
  final List<String> _chipLabels = ['UI/UX Designer', 'React', 'Blockchain dev', 'Flutter'];

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
        title: Row(
          children: [
            Text(
              'Projects',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            const AppBarSearchBar(hint: 'Search'),
            const SizedBox(width: 12),
            const FilterButton()
          ],
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
        child: Column(
          children: [
            ListView.separated(
              itemCount: demoGigs.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemBuilder: (context, index) => GigCard(gig: demoGigs[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 14),
            ),
            const SizedBox(height: 75),
            const RefreshButton(),
          ],
        ),
      ),
    );
  }
}

//

class GigCard extends StatelessWidget {
  final GigModel gig;
  const GigCard({super.key, required this.gig});
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorScheme.primaryContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(gig.mentor.profileImagePath),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(gig.mentor.name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorScheme.primary)),
                    Text(gig.mentor.title, style: TextStyle(fontSize: 10, color: colorScheme.outline)),
                  ],
                ),
              ),
              AppSVGIcon(iconPath: gig.save ? IconPaths.saveFill : IconPaths.saveOutline, size: 12)
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(gig.gigTitle,
                    overflow: TextOverflow.ellipsis, maxLines: 10, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
              ),
              Text(gig.price.toString(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
            ],
          ),
          Text(
            gig.postedTime,
            style: TextStyle(fontSize: 6, color: colorScheme.outline),
          ),
          const SizedBox(height: 6),
          HomeServiceDescription(gig.description)
        ],
      ),
    );
  }
}

class HomeServiceDescription extends StatelessWidget {
  final String content;
  const HomeServiceDescription(this.content, {super.key});
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: content,
            style: TextStyle(fontSize: 10, color: colorScheme.primary),
          ),
          TextSpan(
            text: ' see more',
            style: TextStyle(fontSize: 10, color: colorScheme.onSurface),
            recognizer: TapGestureRecognizer()..onTap = () => debugPrint('See more tapped'),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/demo_data.dart';
import 'package:mentor_connect/one_to_one_call_screen.dart';
import 'package:mentor_connect/theme/app_widget.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens/home_page.dart';
import 'package:text_scroll/text_scroll.dart';

class MentorShipDetailView extends StatefulWidget {
  final MentorModel mentor;
  const MentorShipDetailView({super.key, required this.mentor});

  @override
  State<MentorShipDetailView> createState() => _MentorShipDetailViewState();
}

class _MentorShipDetailViewState extends State<MentorShipDetailView> {
  String? selectedAppointment;
  String? selectedDate;
  int? selectedDateIndex;
  int? selectedTimeIndex;
  int? selectedLanguageIndex;

  dynamic selectAppointment(String? value) {
    setState(() {
      selectedAppointment = value;
    });
  }

  void selectDate(bool isSelected, int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  void selectTime(bool isSelected, int index) {
    setState(() {
      selectedTimeIndex = index;
    });
  }

  void selectLanguage(bool isSelected, int index) {
    setState(() {
      selectedLanguageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: MyAppBar(
        leadingWidth: 30,
        title: Row(
          children: [
            CircleAvatar(radius: 18, backgroundImage: AssetImage(widget.mentor.profileImagePath)),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextScroll(
                    widget.mentor.name,
                    intervalSpaces: 10,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorScheme.primary),
                    velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                  ),
                  const SizedBox(height: 4),
                  Text(widget.mentor.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, color: colorScheme.outline)),
                ],
              ),
            ),
          ],
        ),
        actions: const [ViewProfileButton(), SizedBox(width: 16)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 21),
              itemBuilder: (context, index) {
                String appointmentValue = 'appointment_$index';
                return MentorShipAppointmentCard(
                  title: index.isEven ? 'Career guidance' : 'Resume Review',
                  onChanged: selectAppointment,
                  selectedValue: selectedAppointment,
                  value: appointmentValue,
                );
              },
            ),
            const DividerHeading(title: 'Book your slot'),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 96 / 42),
              itemCount: demoDates.length,
              itemBuilder: (context, index) => GridChip(
                disabled: false,
                // disable: true,
                selected: selectedDateIndex == null ? false : selectedDateIndex == index,
                title: demoDates[index],
                onSelected: (newTime) {
                  selectedDateIndex = index;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 96 / 42),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) => GridChip(
                disabled: timeSlots[index] == 'Booked' || selectedDateIndex == null,
                selected: selectedTimeIndex == null ? false : selectedTimeIndex == index,
                title: timeSlots[index],
                onSelected: (newTime) {
                  selectedTimeIndex = index;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Preferred language ', style: TextStyle(color: colorScheme.primary, fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 96 / 42),
              itemCount: demoLanguage.length,
              itemBuilder: (context, index) => GridChip(
                disabled: false,
                selected: selectedLanguageIndex == null ? false : selectedLanguageIndex == index,
                title: demoLanguage[index],
                onSelected: (newTime) {
                  selectedLanguageIndex = index;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: AppFilledButton(
          title: 'Book',
          onPressed: selectedAppointment != null
              ? () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OneToOneCallScreen(),
                      ));
                }
              : null,
        ),
      ),
    );
  }
}

// ___

class GridChip extends StatefulWidget {
  final bool disabled;
  final bool selected;
  final String title;
  final Function(bool) onSelected;

  const GridChip({
    Key? key,
    required this.title,
    required this.disabled,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<GridChip> createState() => _GridChipState();
}

class _GridChipState extends State<GridChip> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: widget.disabled
          ? null
          : () {
              final newSelectedState = !widget.selected;
              setState(() {});
              widget.onSelected(newSelectedState);
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.disabled
              ? colorScheme.primary.withOpacity(0.5)
              : widget.selected
                  ? colorScheme.primary
                  : colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8,
                color: widget.disabled
                    ? colorScheme.onPrimary.withOpacity(0.5)
                    : widget.selected
                        ? colorScheme.onPrimary
                        : colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DividerHeading extends StatelessWidget {
  final String title;
  final double indentation;
  const DividerHeading({super.key, required this.title, this.indentation = 16.0});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: indentation),
      child: Row(
        children: [
          Expanded(child: Container(height: 3, decoration: BoxDecoration(color: colorScheme.outlineVariant))),
          const SizedBox(width: 20),
          Text(title, style: TextStyle(color: colorScheme.primary, fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(width: 20),
          Expanded(child: Container(height: 3, decoration: BoxDecoration(color: colorScheme.outlineVariant))),
        ],
      ),
    );
  }
}

class MentorShipAppointmentCard extends StatelessWidget {
  final Function(String?)? onChanged;
  final String? selectedValue;
  final String value;
  final String title;

  const MentorShipAppointmentCard({
    super.key,
    required this.onChanged,
    required this.selectedValue,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomRadioButton(
                  value: value,
                  onChanged: onChanged,
                  selectedValue: selectedValue,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 6, top: 6, bottom: 6),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppSVGIcon(iconPath: IconPaths.cameraMovie, color: Theme.of(context).colorScheme.outline),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '1 Hour',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Video Meeting',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '₹200',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.surface,
                          ),
                        ),
                        AppSVGIcon(
                          iconPath: IconPaths.angleSmallRight,
                          color: colorScheme.surface,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final Function(String?)? onChanged;
  final String? selectedValue;
  final String value;

  const CustomRadioButton({super.key, required this.onChanged, required this.selectedValue, required this.value});

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == selectedValue;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0XFFC3C4FF), width: 2.0),
        color: isSelected ? colorScheme.primary : Colors.white,
      ),
    );
  }
}

class ViewProfileButton extends StatelessWidget {
  const ViewProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: colorScheme.primaryContainer),
        child: Text('Profile', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: colorScheme.primary)),
      ),
    );
  }
}

// _____________

class AppBarSearchDelegate extends SearchDelegate<String> {
  final String? hint;

  AppBarSearchDelegate({this.hint});

  @override
  String get searchFieldLabel => hint ?? 'Search';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results here
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions here
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.search),
          title: Text('Suggestion for: $query'),
          onTap: () {
            // Handle suggestion tap
            showResults(context);
          },
        ),
      ],
    );
  }
}
// showSearch(
//           context: context,
//           delegate: AppBarSearchDelegate(hint: hint),
//         );

// Toggle Chip
class ToggleGridChip extends StatefulWidget {
  final bool disabled;
  final bool initialSelected;
  final String title;
  final Function(bool) onSelected;

  const ToggleGridChip({
    Key? key,
    required this.title,
    required this.disabled,
    required this.initialSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<ToggleGridChip> createState() => ToggleGridChipState();
}

class ToggleGridChipState extends State<ToggleGridChip> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected;
  }

  @override
  void didUpdateWidget(ToggleGridChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelected != widget.initialSelected) {
      _selected = widget.initialSelected;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: widget.disabled
          ? null
          : () {
              setState(() {
                _selected = !_selected;
              });
              widget.onSelected(_selected);
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _selected ? colorScheme.primary : colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _selected ? colorScheme.primary : colorScheme.outline,
            width: 1,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8,
                color: widget.disabled
                    ? colorScheme.onSurface.withOpacity(0.5)
                    : _selected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/demo_data.dart';
import 'package:mentor_connect/one_to_one_call_screen.dart';
import 'package:mentor_connect/theme/app_widget.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens/home_page.dart';

class MentorShipDetailView extends StatefulWidget {
  final MentorModel mentor;
  const MentorShipDetailView({super.key, required this.mentor});

  @override
  State<MentorShipDetailView> createState() => _MentorShipDetailViewState();
}

class _MentorShipDetailViewState extends State<MentorShipDetailView> {
  String? selectedAppointment;
  String? selectedDate;
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;
  int selectedLanguageIndex = 0;

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.mentor.name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorScheme.primary)),
                const SizedBox(height: 4),
                Text(widget.mentor.title, style: TextStyle(fontSize: 10, color: colorScheme.outline)),
              ],
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
                return MentorShipAppointmentCard(onChanged: selectAppointment, selectedValue: selectedAppointment, value: appointmentValue);
              },
            ),
            const DividerHeading(title: 'Book your slot'),
            const SizedBox(height: 12),
            SizedBox(
              height: 32,
              child: ListView.separated(
                itemCount: demoDates.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) => MyChoiceChip(
                    isSelected: selectedDateIndex == index, label: demoDates[index], onSelected: (bool value) => selectDate(value, index)),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 0.0,
                children: List.generate(timeSlots.length, (index) {
                  return MyChoiceChip(
                    isSelected: selectedTimeIndex == index,
                    label: timeSlots[index],
                    onSelected: (bool value) {
                      selectTime(value, index);
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Preferred language ', style: TextStyle(color: colorScheme.primary, fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 32,
              child: ListView.separated(
                itemCount: demoLanguage.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) => MyChoiceChip(
                    isSelected: selectedLanguageIndex == index,
                    label: demoLanguage[index],
                    onSelected: (bool value) => selectLanguage(value, index)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
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

  const MentorShipAppointmentCard({
    super.key,
    required this.onChanged,
    required this.selectedValue,
    required this.value,
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
                  'Career guidance',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const AppSVGIcon(iconPath: IconPaths.cameraMovie),
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
      width: 16,
      height: 16,
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


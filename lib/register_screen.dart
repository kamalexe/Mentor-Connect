import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens.dart';
import 'package:mentor_connect/sign_up_screen.dart';
import 'package:mentor_connect/theme/app_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ColoredBox(
            color: colorScheme.primary,
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterBanner(),
                SizedBox(height: 60),
                SelectableProfessionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// _________

class RegisterBanner extends StatelessWidget {
  const RegisterBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(IconPaths.ellipseLogin, width: MediaQuery.of(context).size.width, color: Colors.white),
        const Positioned(top: 0, child: RegisterAppBar()),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(ImagePaths.whatProfession, height: 120),
            ],
          ),
        )
      ],
    );
  }
}

class RegisterAppBar extends StatelessWidget {
  const RegisterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(right: 13, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              Color color;
              if (index == 0) {
                color = colorScheme.primary;
              } else {
                color = colorScheme.primaryContainer;
              }

              return Container(
                width: 36,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
              );
            }),
          ),
          const SizedBox(width: 16),
          Image.asset(ImagePaths.mentorConnect, height: 56),
        ],
      ),
    );
  }
}

class SelectableProfessionWidget extends StatefulWidget {
  const SelectableProfessionWidget({super.key});

  @override
  SelectableProfessionWidgetState createState() => SelectableProfessionWidgetState();
}

class SelectableProfessionWidgetState extends State<SelectableProfessionWidget> {
  String _selectedProfession = 'Select one';

  void _onSelectProfession(String profession) {
    setState(() {
      _selectedProfession = profession;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Profession',
                style: TextStyle(fontSize: 12, color: colorScheme.onPrimary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                      child: Text(
                        _selectedProfession,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary.withOpacity(_selectedProfession == 'Select one' ? 0.53 : 1),
                        ),
                      ),
                    ),
                    AppSVGIcon(iconPath: IconPaths.angleSmallDown, color: colorScheme.onPrimary)
                  ],
                ),
                Divider(color: colorScheme.primary, height: 0),
                InkWell(
                  onTap: () => _onSelectProfession('Mentor'),
                  child: _buildSelectableRow('Mentor', colorScheme),
                ),
                const Divider(height: 0),
                InkWell(
                  onTap: () => _onSelectProfession('Student'),
                  child: _buildSelectableRow('Student', colorScheme),
                ),
                const Divider(height: 0),
                InkWell(
                  onTap: () => _onSelectProfession('University'),
                  child: _buildSelectableRow('University', colorScheme),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              AppFilledButtonSmall(
                title: 'Send',
                bgColor: Colors.white,
                borderRadius: 60,
                titleColor: colorScheme.primary,
                onPressed: _selectedProfession != 'Select one'
                    ? () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                      }
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build selectable rows with dynamic selection indication
  Widget _buildSelectableRow(String profession, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
          child: Text(
            profession,
            style: TextStyle(
              color: colorScheme.onPrimary.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        Icon(
          _selectedProfession == profession ? Icons.check : null,
          color: colorScheme.onPrimary,
        ),
      ],
    );
  }
}

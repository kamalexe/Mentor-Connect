import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';

class OneToOneCallScreen extends StatelessWidget {
  const OneToOneCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [Expanded(child: Image.asset(ImagePaths.mentorOnVideo, fit: BoxFit.cover))],
                ),
              ),
              Expanded(
                child: Row(
                  children: [Expanded(child: Image.asset(ImagePaths.mentiOnVideo, fit: BoxFit.cover))],
                ),
              ),
            ],
          ),
          VideoAppBar(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToggleIconButton(
              icon: IconPaths.videoSlash,
              selectedIcon: IconPaths.angleSmallDown,
              onChanged: (value) {},
            ),
            MyIconButton(
              svgIcon: IconPaths.phoneSlash,
              onTap: () => Navigator.pop(context),
              backgroundColor: Colors.red,
              iconColor: Colors.white,
            ),
            ToggleIconButton(
              icon: IconPaths.volumeMute,
              selectedIcon: IconPaths.angleSmallDown,
              onChanged: (value) {},
            ),
            MyIconButton(svgIcon: IconPaths.messages1, onTap: () {}),
          ],
        ),
      ),
    );
  }
}

// -------------
class VideoAppBar extends StatelessWidget {
  const VideoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: const AppSVGIcon(iconPath: IconPaths.arrowSmallLeft),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: const Text('15 Min left'),
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleIconButton extends StatefulWidget {
  final ValueChanged<bool> onChanged; // Callback to return the toggle state
  final Color? backgroundColor;
  final Color? iconColor;
  final String icon;
  final String selectedIcon;

  const ToggleIconButton(
      {super.key, required this.onChanged, this.backgroundColor, this.iconColor, required this.icon, required this.selectedIcon});
  @override
  ToggleIconButtonState createState() => ToggleIconButtonState();
}

class ToggleIconButtonState extends State<ToggleIconButton> {
  bool _isToggled = false;

  void _toggleIcon() {
    setState(() {
      _isToggled = !_isToggled;
    });
    widget.onChanged(_isToggled); // Return the new state to the parent widget
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleIcon, // Handle the toggle on tap
      child: Container(
        width: 56, // Button size
        height: 56,
        padding: const EdgeInsets.all(15),
        decoration:
            BoxDecoration(color: widget.backgroundColor ?? Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(100)),
        child: AppSVGIcon(
            iconPath: _isToggled ? widget.selectedIcon : widget.icon, color: widget.iconColor ?? Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final String svgIcon;
  final Color? iconColor;
  final Function() onTap;
  final Color? backgroundColor;

  const MyIconButton({super.key, required this.onTap, this.backgroundColor, this.iconColor, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle the toggle on tap
      child: Container(
        width: 56, // Button size
        height: 56,
        padding: const EdgeInsets.all(15),
        decoration:
            BoxDecoration(color: backgroundColor ?? Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(100)),
        child: AppSVGIcon(iconPath: svgIcon, color: iconColor ?? Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}

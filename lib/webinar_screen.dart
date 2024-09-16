import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';

class WebinarScreen extends StatelessWidget {
  const WebinarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        leadingWidth: 24,
        elevation: 0,
        title: const Text('SIH 2024 Awareness session with Dr. Abhay Jere ', style: TextStyle(fontSize: 12)),
      ),
      body: Column(
        children: [
          const Expanded(flex: 3, child: WebinarHost()),
          const SizedBox(height: 8),
          Expanded(
            flex: 6,
            child: GridView.builder(
              itemCount: demoAudienceList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 101 / 83),
              itemBuilder: (context, index) => WebinarAudience(
                member: demoAudienceList[index],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(8.0),
        child: Container(
            padding: const EdgeInsets.only(left: 8.0, right: 4, top: 4, bottom: 4),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write Something . . . .',
                        contentPadding: const EdgeInsets.only(left: 15),
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primaryContainer, fontSize: 10)),
                  ),
                ),
                IconButton(onPressed: () {}, icon: AppSVGIcon(iconPath: IconPaths.sendMessage))
              ],
            )),
      ),
    );
  }
}

class WebinarHost extends StatelessWidget {
  const WebinarHost({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(ImagePaths.demoWebinar, fit: BoxFit.fitHeight)),
        Positioned(
          bottom: 8,
          left: 8,
          child: Text(
            '15:45',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.25), borderRadius: BorderRadius.circular(16)),
            child: Text('5', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          ),
        )
      ],
    );
  }
}
// ___________________

class WebinarAudience extends StatelessWidget {
  final WebinarAudienceMember member;
  const WebinarAudience({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
          ),
          if (!member.isMuted) AudioWaveAvatar(assetName: member.assetName),
          if (member.isMuted) CircleAvatar(radius: 15, backgroundImage: AssetImage(member.assetName)),
          Positioned(
            left: 6,
            top: 6,
            child: AppSVGIcon(
                iconPath: member.isMuted ? IconPaths.microphoneSlash2 : IconPaths.microphone,
                color: Theme.of(context).colorScheme.outline,
                size: 12),
          ),
          if (member.isHandRaised)
            const Positioned(
              right: 6,
              bottom: 6,
              child: AppSVGIcon(iconPath: IconPaths.handPaper, color: Color(0XFFFFC10E), size: 12),
            )
        ],
      ),
    );
  }
}

class AudioWaveAvatar extends StatefulWidget {
  final String assetName;
  const AudioWaveAvatar({super.key, required this.assetName});

  @override
  _AudioWaveAvatarState createState() => _AudioWaveAvatarState();
}

class _AudioWaveAvatarState extends State<AudioWaveAvatar> {
  Color _outerColor = const Color(0XFFF0F0FE);
  Color _innerColor = const Color(0XFFC3C4FF);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startWaveAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startWaveAnimation() {
    _timer = Timer.periodic(const Duration(microseconds: 100), (Timer timer) {
      setState(() {
        // Toggle between two color pairs to simulate a wave animation
        if (_outerColor == const Color(0XFFF0F0FE)) {
          _outerColor = const Color(0XFFE6E6FD);
          _innerColor = const Color(0XFFB0B1FF);
        } else {
          _outerColor = const Color(0XFFF0F0FE);
          _innerColor = const Color(0XFFC3C4FF);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(begin: const Color(0XFFF0F0FE), end: _outerColor),
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context, Color? outerColor, Widget? child) {
        return Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: outerColor ?? const Color(0XFFF0F0FE),
            borderRadius: BorderRadius.circular(100),
          ),
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: const Color(0XFFC3C4FF), end: _innerColor),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, Color? innerColor, Widget? child) {
              return Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: innerColor ?? const Color(0XFFC3C4FF),
                ),
                child: CircleAvatar(backgroundImage: AssetImage(widget.assetName)),
              );
            },
          ),
        );
      },
    );
  }
}

// Data model for WebinarAudience
class WebinarAudienceMember {
  final String name;
  final String assetName;
  final bool isMuted;
  final bool isHandRaised;

  WebinarAudienceMember({
    required this.name,
    required this.assetName,
    this.isMuted = false,
    this.isHandRaised = false,
  });
}

// Demo list of WebinarAudienceMembers
List<WebinarAudienceMember> demoAudienceList = [
  WebinarAudienceMember(name: "Alice", assetName: ImagePaths.mentiOnVideo, isMuted: false, isHandRaised: true),
  WebinarAudienceMember(name: "Bob", assetName: ImagePaths.image1, isMuted: true, isHandRaised: false),
  WebinarAudienceMember(name: "Charlie", assetName: ImagePaths.image2, isMuted: false, isHandRaised: false),
  WebinarAudienceMember(name: "Diana", assetName: ImagePaths.channelsProfile, isMuted: true, isHandRaised: true),
];

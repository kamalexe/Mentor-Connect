import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/main.dart';
import 'package:mentor_connect/main_screens.dart';
import 'package:mentor_connect/main_screens/home_page.dart';
import 'package:mentor_connect/register_screen.dart';
import 'package:mentor_connect/theme/app_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginBanner(),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Enter Mobile',
                            style: TextStyle(fontSize: 12, color: colorScheme.onPrimary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        decoration: BoxDecoration(color: colorScheme.secondary, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Image.asset(ImagePaths.pngWing10, height: 25, width: 25),
                            const SizedBox(width: 8),
                            Text(
                              '+91',
                              style: TextStyle(color: colorScheme.onPrimary, fontSize: 12),
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(color: Colors.white),
                            ),
                            Expanded(
                                child: TextField(
                              keyboardType: TextInputType.phone,
                              style: TextStyle(color: colorScheme.onPrimary, fontSize: 12),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '8787XXXX61',
                                hintStyle: TextStyle(color: colorScheme.onSecondary, fontSize: 12),
                              ),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      AppFilledButton(
                        title: 'Login with OTP',
                        bgColor: Colors.white,
                        borderRadius: 60,
                        titleColor: colorScheme.primary,
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                        },
                      ),
                      const Divider(height: 52),
                      AppFilledButton(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImagePaths.google, height: 24, width: 24),
                            const SizedBox(width: 8),
                            Text(
                              'Continue with Google',
                              style: TextStyle(color: colorScheme.primary, fontSize: 12),
                            )
                          ],
                        ),
                        bgColor: Colors.white,
                        borderRadius: 60,
                        titleColor: colorScheme.primary,
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBanner extends StatelessWidget {
  const LoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(IconPaths.ellipseLogin, width: MediaQuery.of(context).size.width, color: Colors.white),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(ImagePaths.mentorConnect, height: 80),
              Image.asset(ImagePaths.learnFormMentor, height: 120),
            ],
          ),
        )
      ],
    );
  }
}

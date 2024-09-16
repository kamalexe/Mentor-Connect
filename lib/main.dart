import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentor_connect/constant/images.dart';
import 'package:mentor_connect/theme/app_widget.dart';
import 'package:mentor_connect/theme/color_scheme.dart';
import 'package:mentor_connect/main_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        platform: TargetPlatform.android,
        typography: Typography.material2021(
          colorScheme: blueColorScheme,
          black: Typography.blackMountainView,
          white: Typography.whiteMountainView,
        ),
        colorScheme: blueColorScheme,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const MyHomePage(),
    );
  }
}

class AppSVGIcon extends StatelessWidget {
  final String iconPath;
  final double size;
  final Color? color;

  const AppSVGIcon({super.key, required this.iconPath, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      height: size,
      colorFilter: ColorFilter.mode(color ?? Theme.of(context).colorScheme.primary, BlendMode.srcIn),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Enter Mobile',
                  style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.4), borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Image.asset(ImagePaths.pngWing10, height: 25, width: 25),
                  SizedBox(width: 8),
                  Text(
                    '+91',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 12),
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 12),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '8787XXXX61',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.outline, fontSize: 12),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 28),
            AppFilledButton(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImagePaths.google, height: 24, width: 24),
                  SizedBox(width: 8),
                  Text(
                    'Continue with Google',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12),
                  )
                ],
              ),
              bgColor: Colors.white,
              borderRadius: 60,
              titleColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
            ),
            Divider(
              height: 52,
            ),
            AppFilledButton(
              title: 'Login vai OTP',
              bgColor: Colors.white,
              borderRadius: 60,
              titleColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
            ),
            SizedBox(height: 176)
          ],
        ),
      ),
    );
  }
}

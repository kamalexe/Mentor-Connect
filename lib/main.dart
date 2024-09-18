import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentor_connect/sign_up_screen.dart';
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
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.05),
          ),
          child: child!,
        );
      },
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
      home: const SignUpScreen(),
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

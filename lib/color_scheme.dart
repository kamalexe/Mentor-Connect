import 'package:flutter/material.dart';

const ColorScheme blueColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF5E60CE), // Original primary
  onPrimary: Colors.white, // Contrast with primary
  primaryContainer: Color(0xFFF0F0FE), // Darker variation of primary
  onPrimaryContainer: Color(0xFFA3A4E9), // Contrast with primary container
  secondary: Color(0xFF5E60CE), // Same as primary
  onSecondary: Colors.white, // Contrast with secondary
  secondaryContainer: Color(0xFF4A4BB5), // Darker version of primary
  onSecondaryContainer: Colors.white, // Contrast with secondary container
  tertiaryContainer: Color(0xFF6F71DE), // Slightly lighter than primary
  onTertiaryContainer: Colors.white, // Contrast with tertiary container
  error: Color(0xFF5E60CE), // Use primary color for error for consistency
  onError: Colors.white, // Contrast with error
  errorContainer: Color(0xFF4849B6), // Darker variation for error container
  onErrorContainer: Colors.white, // Contrast with error container
  outline: Color(0xFF7E7E7E), // Lighter variation of primary for outline
  outlineVariant: Color(0xFFC3C4FF), // Even lighter for outline variant
  surface: Colors.white, // Very light version of primary for surface
  onSurface: Colors.black, // Use primary on surface
  onSurfaceVariant: Color(0xFF4849B6), // Darker version for variant
  inverseSurface: Color(0xFF4849B6), // Darker variation for inverse surface
  onInverseSurface: Colors.white, // Contrast with inverse surface
  inversePrimary: Color(0xFF7A7CCF), // Lighter version for inverse primary
  shadow: Color(0xFF3A3B91), // Dark shadow version of primary
  scrim: Color(0xFF2A2B78), // Very dark scrim version of primary
  surfaceTint: Color(0xFF5E60CE), // Primary as surface tint
  primaryFixedDim: Color(0xFF7A7CCF), // Lighter version of primary for dim
  surfaceContainerHigh: Color(0xFFD0D1F4), // Lightened surface container
  surfaceContainerHighest: Color(0xFFC0C1ED), // Highest variation, very light
);

// _____________
TextStyle poppinsBold20(BuildContext context) {
  return TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).colorScheme.primary);
}

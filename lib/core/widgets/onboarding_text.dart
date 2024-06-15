import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const OnboardingText({super.key, required this.text, required this.fontWeight, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle:  TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}

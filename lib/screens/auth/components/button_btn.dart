import 'package:comments_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final Color? buttonColor;
  final String title;
  final Function() onpressed;
  final double borderRadius;
  const Button({
    this.buttonColor,
    required this.title,
    required this.onpressed,
    this.borderRadius = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(buttonColor ?? blue),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(200, 50),
        ),
      ),
      onPressed: onpressed,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
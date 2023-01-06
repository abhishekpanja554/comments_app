import 'package:comments_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPassword;
  const MyTextField(
      {required this.title,
      this.controller,
      this.isPassword = false,
      this.keyboardType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: blue,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: title,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: blue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

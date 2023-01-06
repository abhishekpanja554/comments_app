import 'package:comments_app/constants/colors.dart';
import 'package:comments_app/screens/auth/components/my_textfield.dart';
import 'package:comments_app/screens/auth/components/button_btn.dart' as btn;
import 'package:comments_app/screens/auth/controller.dart';
import 'package:comments_app/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  static String routeName = '/registration';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String btnTitle = "Signup";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Comments",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: blue,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextField(
                      title: "Name",
                      controller: nameController,
                    ),
                    MyTextField(
                      title: "Email",
                      controller: emailController,
                    ),
                    MyTextField(
                      title: "Password",
                      isPassword: true,
                      controller: passwordController,
                    )
                  ],
                ),
              ),
              btn.Button(
                onpressed: () async {
                  if (btnTitle == "Signup") {
                    setState(() {
                      btnTitle = "Signing up...";
                    });
                    await signUp(emailController.text, passwordController.text,
                            nameController.text, context)
                        .then((value) => context.go(LoginPage.routeName));
                    setState(() {
                      btnTitle = "Signup";
                    });
                  }
                },
                title: "Signup",
                borderRadius: 10,
              ),
              GestureDetector(
                onTap: () => context.go(LoginPage.routeName),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

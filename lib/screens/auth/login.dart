import 'package:comments_app/constants/colors.dart';
import 'package:comments_app/screens/auth/components/button_btn.dart' as btn;
import 'package:comments_app/screens/auth/components/my_textfield.dart';
import 'package:comments_app/screens/auth/controller.dart';
import 'package:comments_app/screens/auth/registration.dart';
import 'package:comments_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String btnTitle = "Login";
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
                      title: "Email",
                      keyboardType: TextInputType.emailAddress,
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
                  if (btnTitle == "Login") {
                    setState(() {
                      btnTitle = "Verifying...";
                    });
                    await signIn(emailController.text, passwordController.text,
                            context)
                        .then((value) {
                      if (value) {
                        context.go(HomeScreen.routeName);
                      }
                    });
                    setState(() {
                      btnTitle = "Login";
                    });
                  }
                },
                title: btnTitle,
                borderRadius: 10,
              ),
              GestureDetector(
                onTap: () => context.go(RegistrationPage.routeName),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'New Here? ',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Signup',
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

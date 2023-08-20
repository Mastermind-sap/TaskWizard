import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:todo/constants/colors.dart";
import 'package:todo/widgets/animated_button.dart';
import 'package:todo/widgets/login_dialog.dart';
import "../widgets/signup_dialog.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          OutlinedButton(
            onPressed: null,
            child: AnimatedButton(
                height: 100,
                width: 200,
                text: "Log In",
                animationColor: violet,
                onTapfunc: () => showDialog(
                      context: context,
                      builder: ((ctx) => const LoginDialog()),
                    )),
          ),
          const SizedBox(height: 100),
          OutlinedButton(
            onPressed: null,
            child: AnimatedButton(
                height: 100,
                width: 200,
                text: "Sign In",
                animationColor: violet,
                onTapfunc: () => showDialog(
                      context: context,
                      builder: ((ctx) => const SignUpDialog()),
                    )),
          ),
        ],
      )),
    );
  }
}

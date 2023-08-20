import 'package:flutter/material.dart';
import 'package:todo/screens/login.dart';
import '../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Init function
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  // Function used to push LoginPage after 1.5sec
  _navigatetologin() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context as BuildContext,
        MaterialPageRoute(builder: (context) => LoginPage()));
  }

  // Building the splash screen
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
              Expanded(
                child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logo.png'),
                      ),
                      border: Border.all(
                        color: violet,
                        width: 5,
                      ),
                      shape: BoxShape.circle,
                      color: white,
                      boxShadow: const [
                        BoxShadow(
                          color: violet,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 100.0,
                          spreadRadius: 10.0,
                        ),
                      ],
                    )),
              ),
              const Flexible(
                  child: Text(
                "Task Wizard",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold, color: white),
              ))
            ],
          ),
        ));
  }
}

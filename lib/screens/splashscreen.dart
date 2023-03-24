import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';

import '../constants/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context as BuildContext,
        MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
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

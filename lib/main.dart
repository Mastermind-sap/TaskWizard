import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo/screens/splash_screen.dart';

// The main function calling the root of the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    //  GetMaterialApp used to use GetX as state management
    return const GetMaterialApp(
        //this is used to remove the debug mode banner
        debugShowCheckedModeBanner: false,
        title: 'Task Wizard',
        //Calls the splash screen page when the app starts
        home: SplashScreen());
  }
}

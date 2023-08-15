//import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'package:todo/constants/colors.dart';
import 'package:todo/screens/splashscreen.dart';
//import './screens/home.dart';
//import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Wizard',
        home: Splash());
    // AnimatedSplashScreen(
    //     duration: 3000,
    //     splash: Flex(
    //       direction: Axis.vertical,
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Expanded(
    //           child: Container(
    //               width: 500,
    //               height: 500,
    //               decoration: const BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: white,
    //                   image: DecorationImage(
    //                     fit: BoxFit.contain,
    //                     image: AssetImage('assets/images/logo.png'),
    //                   ))),
    //         ),
    //         const Flexible(
    //             child: Text(
    //           "Task Wizard",
    //           style: TextStyle(
    //               fontSize: 10, fontWeight: FontWeight.bold, color: white),
    //         ))
    //       ],
    //     ),

    //     //Try2
    //     // Column(
    //     //   mainAxisAlignment: MainAxisAlignment.center,
    //     //   crossAxisAlignment: CrossAxisAlignment.center,
    //     //   mainAxisSize: MainAxisSize.max,
    //     //   children: [
    //     //     Expanded(
    //     //         child: Container(
    //     //             width: 200,
    //     //             height: 200,
    //     //             decoration: const BoxDecoration(
    //     //               shape: BoxShape.circle,
    //     //               color: white,
    //     //               image: DecorationImage(
    //     //                 fit: BoxFit.fitHeight,
    //     //                 image: AssetImage('assets/images/logo.png'),
    //     //               ),
    //     //             ))),
    //     //     const Flexible(
    //     //     child: Text(
    //     //   "Task Wizard",
    //     //   style: TextStyle(
    //     //       fontSize: 10, fontWeight: FontWeight.bold, color: white),
    //     // ))
    //     //   ],
    //     // ),

    //     //Try1
    //     //Container(
    //     //   height: 40,
    //     //   width: 40,
    //     //   child: ClipRRect(
    //     //     borderRadius: BorderRadius.circular(20),
    //     //     child: Image.asset('assets/images/ToDoApp.png'),
    //     //   ),
    //     // ),
    //     nextScreen: Home(),
    //     splashTransition: SplashTransition.fadeTransition,
    //     pageTransitionType: PageTransitionType.fade,
    //     backgroundColor: black));
  }
}

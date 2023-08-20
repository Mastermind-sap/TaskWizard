import '../constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
    backgroundColor: titleBGColor,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      "Task Wizard",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: black),
    ),
    actions: [
      Builder(
        builder: (context) => IconButton(
          icon: SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.jpeg'),
            ),
          ),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      ),
    ],
  );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
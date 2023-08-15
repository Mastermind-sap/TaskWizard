//copied from https://github.com/mt-tadayon/flutter_hover_button/blob/master/lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';

import '../screens/home.dart';

class AnimatedButton extends StatefulWidget {
  final double height;
  final double width;
  final String text;
  final Color animationColor;
  final Function onTapfunc;

  AnimatedButton(
      {required this.height,
      required this.width,
      required this.text,
      required this.animationColor,
      required this.onTapfunc});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late Color textColor;
  late Color borderColor;
  late AnimationController _controller;
  late Animation _animation;
  late Animation _borderAnimation;

  @override
  void initState() {
    super.initState();
    textColor = white;
    borderColor = blue;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween(begin: 0.0, end: 500.0)
        .animate(CurvedAnimation(curve: Curves.easeIn, parent: _controller))
      ..addListener(() {
        setState(() {});
      });
    _borderAnimation =
        ColorTween(begin: blue, end: widget.animationColor).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                color: _borderAnimation.value,
                width: 2,
              )),
          child: InkWell(
            onTap: () {
              widget.onTapfunc();
            },
            onHover: (value) {
              if (value) {
                _controller.forward();
                setState(() {
                  textColor = Colors.white;
                  borderColor = widget.animationColor;
                });
              } else {
                _controller.reverse();
                setState(() {
                  textColor = white;
                  borderColor = blue;
                });
              }
            },
            child: Container(
              color: appBGColor,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.animationColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: _animation.value,
                    ),
                  ),
                  Center(
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      style: TextStyle(color: textColor),
                      child: Text(widget.text),
                      curve: Curves.easeIn,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

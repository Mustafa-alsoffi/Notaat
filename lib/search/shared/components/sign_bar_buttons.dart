import 'package:flutter/material.dart';
import './notaat_material.dart';

class SignBottomBarButtons extends StatelessWidget {
  const SignBottomBarButtons({
    Key? key,
    required this.screenWidth,
    required this.onPressed,
  }) : super(key: key);

  final double screenWidth;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      UIButton(
          text: 'Login',
          textColor: Colors.white,
          alignment: Alignment.center,
          color: Color(0xff7B9DCA),
          height: 40,
          width: screenWidth * 0.3,
          onPressed: onPressed
          ),
      SizedBox(width: screenWidth * 0.2),
      UIButton(
          text: 'Sign up',
          textColor: Color(0xff535050),
          alignment: Alignment.center,
          color: Colors.white,
          height: 40,
          width: screenWidth * 0.3,
          onPressed: () {})
    ]);
  }
}
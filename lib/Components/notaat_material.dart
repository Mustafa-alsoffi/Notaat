import 'package:flutter/material.dart';

Widget UIButton({
  String? text,
  AlignmentGeometry? alignment,
  Color? color,
  double? height,
  double? width,
  EdgeInsetsGeometry? margin,
  Color? textColor,
}) =>
    TextButton(
        onPressed: () {},
        child: Container(
            alignment: alignment,
            width: width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(74, 0, 0, 0),
                      blurRadius: 4,
                      offset: Offset.fromDirection(8, 4),
                      blurStyle: BlurStyle.inner)
                ]),
            height: height,
            margin: margin,
            child: Text(text ?? 'Button', style: TextStyle(color: textColor))));

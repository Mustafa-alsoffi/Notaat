import 'package:flutter/material.dart';

class UIButton extends StatelessWidget {
  const UIButton({
    Key? key,
    this.text,
    this.textColor,
    this.alignment,
    this.color,
    this.height,
    this.width,
    this.margin,
  }) : super(key: key);
    final text;
  final alignment;
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
            alignment: alignment,
            width: width,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(5), boxShadow: [BoxShadow(color: Color.fromARGB(74, 0, 0, 0),blurRadius: 4, offset: Offset.fromDirection(8,4),blurStyle: BlurStyle.inner)] ),
            height: height,
            margin: margin,
            child: Text(text, style: TextStyle(color: textColor))));
  }
}
        
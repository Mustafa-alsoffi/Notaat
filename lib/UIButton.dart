import 'package:flutter/material.dart';

class UIButton extends StatelessWidget {
  const UIButton({
    Key? key,
    this.alignment,
    this.color,
    this.height,
    this.width,
    this.margin,
  }) : super(key: key);
  final alignment;
  final color;
  final height;
  final width;
  final margin;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
            alignment: alignment,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(5), boxShadow: [BoxShadow(color: Color.fromARGB(74, 0, 0, 0),blurRadius: 4, offset: Offset.fromDirection(8,4),blurStyle: BlurStyle.inner)] ),
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Text('Search', style: TextStyle(color: Colors.white))));
  }
}
        
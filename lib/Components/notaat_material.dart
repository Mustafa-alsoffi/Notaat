import 'package:flutter/material.dart';

Widget UIButton(
        {String? text,
        AlignmentGeometry? alignment,
        Color? color,
        double? height,
        double? width,
        EdgeInsetsGeometry? margin,
        Color? textColor,
        required void Function()? onPressed}) =>
    TextButton(
        onPressed: onPressed,
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

Widget UIDropdownButton({
  required double? containerWidth,
  required String? hint,
  required List<DropdownMenuItem<String>>? values,
  required void Function(String?)? onChange,
  Color? textColor,
}) =>
    Container(
      width: containerWidth ?? 200,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          hint: Text(hint ?? 'No hint',
              style: TextStyle(
                color: textColor ?? Colors.white,
              )),
          items: values,
          onChanged: onChange,
        ),
      ),
    );

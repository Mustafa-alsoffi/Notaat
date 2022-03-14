
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notaat/authentication/modules/login_screen/join.dart';
import 'package:notaat/authentication/shared/remote/shared_helper.dart';

//Button
Widget ButtonNotes({
  double width = double.infinity,
  Color backgroundcolor = Colors.blue,
  double radius = 0.0,
  required Function()? function,
  required String? text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text?.toUpperCase() ?? 'Null',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor,
      ),
    );

// TextFormField

Widget TextBoxNotes({
  TextEditingController? textcontroller,
  TextInputType? type,
  void Function(String)? onsubmit,
  required String Function(String?) validate,
  required String lable,
  IconData? prefixicon,
  bool? isPass,
  double? height,
  double? width,
  Color? color,
}) =>
    Container(
      height: height,
      width: width,
      child: TextFormField(
        keyboardType: type,
        validator: validate,
        onFieldSubmitted: onsubmit,
        obscureText: isPass ?? false,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(prefixicon),
          border: OutlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: color ?? Colors.black)),
        ),
        controller: textcontroller,
      ),
    );

//TextButton

Widget TextButtonNotes({
  required Function()? function,
  required String? text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text!.toUpperCase() ,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );

//AppBar
Widget AppBarNotes(
        {required String title,
        required IconData icon,
        bool centertitle = false}) =>
    AppBar(
      title: Text(title),
      centerTitle: centertitle,
      actions: [
        Icon(icon),
      ],
    );

//Navigator

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget SvgBackNotes(context) => Container(
      color: Color(0xff535050),
      width: 600,
      child: SvgPicture.asset(
        'images/Background.svg',
        height: MediaQuery.of(context).size.height * 0.3,
        fit: BoxFit.fitWidth,
      ),
    );

//drop box button

// Widget UIDropdownButton({
//   @required double containerWidth,
//   @required String hint,
//   @required List<DropdownMenuItem<String>> values,
//   @required void Function(String) onChange,
//   Color textColor,
// }) =>
//     Container(
//       width: containerWidth ?? 200,
//       child: ButtonTheme(
//         alignedDropdown: true,
//         child: DropdownButton(
//           hint: Text(hint ?? 'No hint',
//               style: TextStyle(
//                 color: textColor ?? Colors.white,
//               )),
//           items: values,
//           onChanged: onChange,
//         ),
//       ),
//     );

//remove page when you click button or any tools (called this function)
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

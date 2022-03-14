import 'package:flutter/material.dart';
import 'package:notaat/authentication/shared/components/tools.dart';

class Search_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff535050),
      body: SafeArea(
        child: Container(
          child: SvgBackNotes(context),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitResutlPage extends StatelessWidget {
  const InitResutlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
          child: SvgPicture.asset(
            'assets/Navbar_logo.svg',
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  position.toString(),
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

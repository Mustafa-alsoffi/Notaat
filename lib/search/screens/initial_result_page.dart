import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../shared/components/sign_bar_buttons.dart';
import 'package:notaat/authentication/authentication.dart' as auth;

class InitResutlPage extends StatelessWidget {
  const InitResutlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
      body: Column(
        children: [
          Row(children: [Text('Notes for UniversityName'), IconButton(onPressed: (){}, icon: Icon(Icons.sort))],),
          Expanded(
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
        ],
      ),
      persistentFooterButtons: [
        SignBottomBarButtons(
            screenWidth: screenWidth,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => auth.Login_Users()),
              );
            })
      ],
    );
  }
}

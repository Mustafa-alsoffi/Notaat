import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../shared/components/sign_bar_buttons.dart';
import 'package:notaat/authentication/authentication.dart' as auth;

class InitResutlPage extends StatelessWidget {
  const InitResutlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
          actions: [
            TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                'assets/cart.svg',
                fit: BoxFit.contain,
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Notes for "UniversityName"'),
                  Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0.0),
                        alignment: Alignment.bottomCenter,
                        // constraints:
                        //     BoxConstraints(minWidth: 60, minHeight: 60),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/filter.svg',
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.fill,
                          height: 30,
                        ),
                      ),
                      SearchField(screenWidth: screenWidth)
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, position) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ACC/ACF3600 Auditing & Assurance - Summary Notes',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Monash ACC3600 - Auditing And Assurance',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Text(
                            'For Semester 2, 2021',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          Text(
                            '91 pages',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          Text(
                            '10 sold',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: screenWidth * 0.3,
          maxWidth: screenWidth * 0.4,
          maxHeight: 45,
          minHeight: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        maxLines: null,
        cursorHeight: 3.0,
        autofocus: false,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: Color.fromARGB(192, 158, 158, 158), fontSize: 10),
          hintText: ("Search by code/name"),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        style: (TextStyle(
          color: Colors.black,
          fontSize: 11,
        )),
      ),
    );
  }
}

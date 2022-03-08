import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Components/notaat_material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List> countries;
  Future<List> getCountries() async {
    var response =
        await http.get(Uri.parse('https://restcountries.com/v2/all'));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson).map((country) => country['name']).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  void getUniversities() async {}

  @override
  void initState() {
    super.initState();
    countries = getCountries();
  }

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xff535050),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Container(
                  constraints: BoxConstraints(maxHeight: 500),
                  color: Color(0xffFFFEEC),
                  width: parentWidth,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: SvgPicture.asset(
                    'assets/Background.svg',
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Text('Start searching for \nnotes now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 20),
                  FutureBuilder<List>(
                      future: countries,
                      builder: (Buildcontext, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            width: 250,
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(isExpanded: true,
                                hint: Text('Choose a country',
                                    style: TextStyle(color: Colors.white)),
                                items: snapshot.data
                                    ?.map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('$snapshot.error');
                        }
                        return CircularProgressIndicator();
                      }),
                  SizedBox(height: 15 * 2),
                  Container(
                    width: 250,
                    child: ButtonTheme(
                     alignedDropdown: true, 
                      child: DropdownButton(
                        hint: Text('Choose a university',
                            style: TextStyle(color: Colors.white,)),
                        items: ['UTM', 'University of AL-Razi Univers', 'UM', 'UCSI']
                            .map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  SizedBox(height: 25 * 2),
                ],
              ),
            ),
            Center(
                child: UIButton(
                    text: 'Search',
                    textColor: Colors.white,
                    alignment: Alignment.center,
                    color: Color(0xff7B9DCA),
                    height: 40,
                    width: null,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    onPressed: getCountries)),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.bottomLeft,
                child: Text(
                    'Sign up now to start \nsharing, selling and buying notes!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
        persistentFooterButtons: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            UIButton(
                text: 'Login',
                textColor: Colors.white,
                alignment: Alignment.center,
                color: Color(0xff7B9DCA),
                height: 40,
                width: parentWidth * 0.3,
                onPressed: () {}),
            SizedBox(width: parentWidth * 0.2),
            UIButton(
                text: 'Sign up',
                textColor: Color(0xff535050),
                alignment: Alignment.center,
                color: Colors.white,
                height: 40,
                width: parentWidth * 0.3,
                onPressed: () {})
          ])
        ]);
  }
}

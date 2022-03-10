import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:convert';
import 'package:notaat/shared/countryfetch_cubit.dart';
import '../components/notaat_material.dart';
import '../models/country.dart';
import './Login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void getUniversities() async {}

  @override
  void initState() {
    super.initState();
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
                    constraints: BoxConstraints(maxHeight: 475),
                    color: Color(0xffFFFEEC),
                    width: parentWidth,
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: SvgPicture.asset(
                      'assets/Background.svg',
                      fit: BoxFit.fill,
                    ))),
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
                  BlocBuilder<CountryfetchCubit, CountryfetchState>(
                    builder: (context, state) {
                      if (state is CountryfetchLoading) {
                        return CircularProgressIndicator();
                      } else if (state is CountryfetchStateLoaded) {
                        return UIDropdownButton(
                            containerWidth: parentWidth * 0.7,
                            hint: 'Choose a country',
                            values: state.countriesList.map((Country value) {
                              return DropdownMenuItem(
                                value: value.name,
                                child: SizedBox(
                                    width: 300, child: Text(value.name)),
                              );
                            }).toList(),
                            onChange: (_) {},
                            textColor: Colors.white);
                      } else {
                        return Text('Error');
                      }
                    },
                  ),
                  SizedBox(height: 15 * 2),
                  BlocBuilder<CountryfetchCubit, CountryfetchState>(
                    builder: (context, state) {
                      if (state is CountryfetchLoading) {
                        return CircularProgressIndicator();
                      } else if (state is CountryfetchStateLoaded) {
                        return Container(
                          width: parentWidth * 0.7,
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              hint: Text('Choose a university',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              items: state.countriesList.map((Country value) {
                                return DropdownMenuItem(
                                  value: value.name,
                                  child: SizedBox(
                                      width: 300, child: Text(value.name)),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        );
                      } else {
                        return Text('Error');
                      }
                    },
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
                    onPressed: (){})),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }),
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

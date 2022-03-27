import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notaat/search/cubit/countryfetch_cubit.dart';
import '../cubit/university_cubit.dart';
import '../models/country.dart';
import '../models/university.dart';
import '../shared/components/notaat_material.dart';
import '../shared/components/sign_bar_buttons.dart';
import './initial_result_page.dart';
import 'package:notaat/authentication/authentication.dart' as auth;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? countrySelected, universitySelected;

  @override
  void initState() {
    super.initState();
  }

  //* This function to update the hint in the dropdown button
  void selectDropdownItem(String? value, int index) {
    setState(() {
      switch (index) {
        case 0:
          countrySelected = value;
          universitySelected = null;
          break;
        case 1:
          universitySelected = value;
          break;
      }
    });
  }

  void submitCountryName(BuildContext context, String countryName) {
    selectDropdownItem(countryName, 0);
    final universityCubit = BlocProvider.of<UniversityCubit>(context);
    universityCubit.fetchUniversityAPI(countryName);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xff535050),
        body: LayoutBuilder(builder: (context, constraint) {
          return Container(
            height: constraint.maxHeight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SafeArea(
                      child: Container(
                          constraints: BoxConstraints(maxHeight: 475),
                          color: Color(0xffFFFEEC),
                          width: screenWidth,
                          height: MediaQuery.of(context).size.height * 0.3,
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
                        SizedBox(height: constraint.maxHeight * 0.01),
                        Container(
                          width: double.infinity,
                          child: Text('Start searching for \nnotes now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(height: constraint.maxHeight * 0.01),
                        BlocBuilder<CountryfetchCubit, CountryfetchState>(
                          builder: (context, state) {
                            if (state is CountryfetchLoading) {
                              return CircularProgressIndicator(
                                  color: Colors.white);
                            } else if (state is CountryfetchStateLoaded) {
                              return UIDropdownButton(
                                  containerWidth: screenWidth * 0.6,
                                  containerHeight: constraint.maxHeight * 0.1,
                                  hint: countrySelected ?? 'Choose a country',
                                  values:
                                      state.countriesList.map((Country value) {
                                    return DropdownMenuItem(
                                      value: value.name,
                                      child: SizedBox(
                                          width: screenWidth * 0.6,
                                          child: Text(value.name)),
                                    );
                                  }).toList(),
                                  onChange: (countryName) {
                                    submitCountryName(context, countryName!);
                                  },
                                  textColor: Colors.white);
                            } else {
                              return SnackBar(
                                  content:
                                      Text('Error loading list of countries'));
                            }
                          },
                        ),
                        SizedBox(height: constraint.maxHeight * 0.01),
                        BlocBuilder<UniversityCubit, UniversityState>(
                          builder: (context, state) {
                            if (state is UniversityfetchLoading) {
                              return CircularProgressIndicator(
                                  color: Colors.white);
                            } else if (state is UniversityfetchStateLoaded) {
                              if (state.universitiesList.length == 0 &&
                                  countrySelected != null)
                                return Container(
                                    child: Text(
                                        'Sorry, we have no list of universities for the chosen country.',
                                        style: TextStyle(color: Colors.red)));
                              else
                                return UIDropdownButton(
                                    containerWidth: screenWidth * 0.6,
                                    containerHeight: constraint.maxHeight * 0.1,
                                    hint: universitySelected ??
                                        'Choose a university',
                                    values: state.universitiesList
                                        .map((University value) {
                                      return DropdownMenuItem(
                                        value: value.name,
                                        child: SizedBox(
                                            width: 300,
                                            child: SizedBox(
                                                width: 300,
                                                child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: SizedBox(
                                                        width:
                                                            screenWidth * 0.6,
                                                        child: Text(
                                                            value.name ??
                                                                'None'))))),
                                      );
                                    }).toList(),
                                    onChange: (value) {
                                      selectDropdownItem(value, 1);
                                    },
                                    textColor: Colors.white);
                            } else {
                              return SnackBar(
                                  content: Text(
                                      'Error loading list of universities'));
                            }
                          },
                        ),
                        SizedBox(height: constraint.maxHeight * 0.02),
                      ],
                    ),
                  ),
                  Center(
                      child: UIButton(
                          text: 'Search',
                          textColor: Colors.white,
                          alignment: Alignment.center,
                          color: Color(0xff7B9DCA),
                          height: constraint.maxHeight * 0.05,
                          width: constraint.maxWidth * 0.8,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitResutlPage()),
                            );
                          })),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 30),
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        child: Text(
                            'Sign up now to start \nsharing, selling and buying notes!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  SizedBox(height: constraint.maxHeight * 0.05)
                ]),
          );
        }),
        persistentFooterButtons: [
          SignBottomBarButtons(screenWidth: screenWidth, onPressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => auth.Login_Users()),
            );
          })
        ]);
  }
}

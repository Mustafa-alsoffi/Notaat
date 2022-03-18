import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:notaat/authentication/screens/register/register_screen.dart';
import 'package:notaat/authentication/screens/search_page_screen/search_screen.dart';
import 'package:notaat/authentication/shared/bloc/join/joincubit.dart';
import 'package:notaat/authentication/shared/bloc/join/joinstate.dart';
import 'package:notaat/authentication/shared/components/tools.dart';

class Join_Screen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  TextEditingController namecontoller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinCubit(),
      child: BlocConsumer<JoinCubit, JoinState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Color(0xff535050),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgBackNotes(context),
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Center(
                        child: Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Text(
                                'Hi dear ,',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              Text(
                                'user we need the following infomation to verify that \n you are a student and registered at the given\n university',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 15),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextBoxNotes(
                                height: 80,
                                width: 400,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name';
                                  }
                                  throw('Error validating name at join.dart');
                                },
                                lable: 'Name',
                                textcontroller: namecontoller,
                              ),
                              TextBoxNotes(
                                height: 80,
                                width: 400,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'University Email';
                                  }
                                  throw('Error validating email at join.dart');
                                },
                                lable: 'University Email',
                                textcontroller: emailcontroller,
                              ),
                              TextBoxNotes(
                                height: 80,
                                width: 400,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'password';
                                  }
                                  throw('Error validating password at join.dart');
                                },
                                lable: 'Password',
                                textcontroller: passcontroller,
                              ),
                              TextBoxNotes(
                                height: 80,
                                width: 400,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'phone';
                                  }
                                  throw('Error validating phone at join.dart');
                                },
                                lable: 'Phone',
                                textcontroller: phonecontroller,
                              ),
                              ButtonNotes(
                                function: () {
                                  if (formkey.currentState!.validate()) {
                                    JoinCubit.get(context).userRegister(
                                      name: namecontoller.text,
                                      email: emailcontroller.text,
                                      password: passcontroller.text,
                                      phone: phonecontroller.text, uId: '',
                                    );

                                    navigateTo(context, Search_Screen());
                                  }
                                },
                                text: 'NEXT',
                                width: 80,
                                radius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

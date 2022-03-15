import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notaat/authentication/models/user_model.dart';
import 'package:notaat/authentication/modules/login_screen/join.dart';
import 'package:notaat/authentication/modules/register/register_screen.dart';
import 'package:notaat/authentication/modules/search_page_screen/search_screen.dart';
import 'package:notaat/authentication/shared/bloc/bloc_login/login_cubit.dart';
import 'package:notaat/authentication/shared/bloc/bloc_login/login_state.dart';
import 'package:notaat/authentication/shared/bloc/join/joincubit.dart';
import 'package:notaat/authentication/shared/components/tools.dart';
import 'package:notaat/authentication/shared/remote/shared_helper.dart';

class Login_Users extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            SharedHelper.savedata(key: 'join', value: true).then((value) {
              if (value) {
                Fluttertoast.showToast(
                  msg: "success",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                //navigateAndFinish(context, Join_Screen());
                navigateTo(context, Search_Screen());
              }
            });
          } else if (state is LoginErorrState) {
            Fluttertoast.showToast(
              msg: 'error',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar:
                AppBarNotes(icon: Icons.menu, title: 'Login', centertitle: true)
                    as PreferredSizeWidget,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                            style: Theme.of(context).textTheme.headline4),
                        Text('Login now to browse our app',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.grey)),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextBoxNotes(
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email Address must not be empty';
                            }
                            throw ('Error: Email Address must not be empty');
                          },
                          lable: 'Email',
                          textcontroller: emailcontrol,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextBoxNotes(
                          isPass: true,
                          textcontroller: passcontrol,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password must not be empty';
                            }
                            throw ('Error: Passwrod must not be empty');
                          },
                          lable: 'Password',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (state is! LoginLoadingState)
                          ButtonNotes(
                            function: () {
                              //check textbox
                              if (formkey.currentState!.validate()) {
                                LoginCubit.get(context).userRegister(
                                  email: emailcontrol.text,
                                  password: passcontrol.text,
                                );
                              }
                            },
                            text: 'login',
                            backgroundcolor: Colors.blue,
                            radius: 10.0,
                          )
                        else
                          Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextButtonNotes(
                          function: () {
                            navigateTo(context, Join_Screen());
                          },
                          text: 'Register',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaat/authentication/models/user_model.dart';
import 'package:notaat/authentication/shared/bloc/bloc_login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userRegister({
    //@required String name,
    required String email,
    required String password,
    //@required String phone,
  }) {
    emit(LoginLoadingState());
    print('done');
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      // print(value.data);
      emit(LoginSuccessState(value.user!.uid));
      print('yesssssss');
    }).catchError((erorr) {
      emit(LoginErorrState(erorr.toString()));
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaat/authentication/models/user_model.dart';
import 'package:notaat/authentication/shared/bloc/join/joinstate.dart';

class JoinCubit extends Cubit<JoinState> {
  JoinCubit() : super(JoinInitialState());

  static JoinCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
  }) {
    print('done');
    emit(JoinLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      usercreate(
        uId: value.user!.uid,
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      print('done');
    }).catchError((erorr) {
      emit(JoinErorrState(erorr.toString()));
    });
  }

  void usercreate({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
  }) {
    NotesUserModel usermodle = NotesUserModel(
      name: name,
      university: email,
      password: password,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(usermodle.toMap())
        .then((value) {
      emit(CrrateSuccessState());
    }).catchError((erorr) {
      emit(CreateErorrState(erorr.toString()));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaat/authentication/shared/bloc/citys/state_citys.dart';
import 'package:notaat/authentication/shared/remote/api_repository.dart';

class CountryCubit extends Cubit<CountryFetchState> {
  final ApiRepository apirepository;

  CountryCubit({required this.apirepository}) : super(CountryFetchIniti());

  static CountryCubit get(context) => BlocProvider.of(context);
}

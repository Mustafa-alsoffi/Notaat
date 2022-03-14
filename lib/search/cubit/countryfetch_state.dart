part of 'countryfetch_cubit.dart';

@immutable
abstract class CountryfetchState {}

class CountryfetchInitial extends CountryfetchState {}

class CountryfetchLoading extends CountryfetchState {}

class CountryfetchStateLoaded extends CountryfetchState {

  final List<Country> countriesList;

  CountryfetchStateLoaded({required this.countriesList});

}


class CountryfetchError extends CountryfetchState {}
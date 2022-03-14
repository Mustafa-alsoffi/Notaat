part of './university_cubit.dart';

@immutable
abstract class UniversityState {}

class UniversityInitial extends UniversityState {}

class UniversityfetchInitial extends UniversityState {}

class UniversityfetchLoading extends UniversityState {}

class UniversityfetchStateLoaded extends UniversityState {

  final List<University> universitiesList;

  UniversityfetchStateLoaded({required this.universitiesList});

}


class UniversityfetchError extends UniversityState {}
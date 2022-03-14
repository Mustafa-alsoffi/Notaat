import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/university.dart';
import '../repository/api_repository.dart';

part 'university_state.dart';

class UniversityCubit extends Cubit<UniversityState> {
  final ApiRepository apiRepository;

  UniversityCubit({required this.apiRepository})
      : super(UniversityInitial());

  Future<void> fetchUniversityAPI(String? countryName) async {
    emit(UniversityfetchLoading());
    try {
      final List<University>? universityList = await apiRepository.getUniversityList(countryName);
      emit(UniversityfetchStateLoaded(universitiesList: universityList ?? []));
    } catch (e) {
      print('Error: $e');
    }
  }
}

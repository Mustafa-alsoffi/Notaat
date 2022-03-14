import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/country.dart';
import '../repository/api_repository.dart';

part 'countryfetch_state.dart';

class CountryfetchCubit extends Cubit<CountryfetchState> {
  final ApiRepository apiRepository;

  CountryfetchCubit({required this.apiRepository})
      : super(CountryfetchInitial());

  Future<void> fetchCountryAPI() async {
    emit(CountryfetchLoading());
    try {
      final List<Country>? countryList = await apiRepository.getCountryList();
      emit(CountryfetchStateLoaded(countriesList: countryList ?? []));
    } catch (e) {
      print('Error: $e');
    }
  }
}

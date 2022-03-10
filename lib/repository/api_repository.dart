import '../models/country.dart';
import '../service/api_service.dart';

class ApiRepository {
  const ApiRepository({required this.apiService});
  final ApiService apiService;

  Future<List<Country>?> getCountryList() async {
    final response = await apiService.getCountryData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((country /*each json object*/) => Country.fromMap(country)).toList();
    }
  }
}

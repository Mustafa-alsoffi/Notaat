import '../models/country.dart';
import '../models/university.dart';
import '../service/api_service.dart';

class ApiRepository {
  const ApiRepository({required this.apiService});
  final ApiService apiService;

  Future<List<Country>?> getCountryList() async {
    final response = await apiService.getCountryData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((country /*each json object*/) => Country.fromJson(country)).toList();
    }
  }

  Future<List<University>?> getUniversityList(String? countryName) async {
    final response = await apiService.getUniversityData(countryName);
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((university/*each json object*/) => University.fromJson(university)).toList();
    }
  }
}

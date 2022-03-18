import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiService {
  final _dio = Dio();

  Future<Response?> getCountryData() async {
    try {
    final Response? response = await _dio.get(baseCountriesURL + 'all');
    return response;
    } catch(err){ 
      print('Error: $err');
      return err as Future<Response?>;
    }

  }

  Future<Response?> getUniversityData(String? countryName) async {
    try {
    final Response? response = await _dio.get('$baseUniesURL$countryName');
    return response;
    } catch(err){ 
      print('Error: $err');
      return err as Future<Response?>;
    }

  }
}
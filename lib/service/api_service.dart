import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiService {
  final _dio = Dio();
  Future<Response?> getCountryData() async {
    try {
    final Response? response = await _dio.get('$baseCountriesURL$countries');
    return response;
    } catch(err){ 
      print('Error: $err');
    }

  }
}
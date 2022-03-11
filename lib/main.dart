import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notaat/cubit/university_cubit.dart';
import 'package:notaat/service/api_service.dart';
import 'package:notaat/cubit/countryfetch_cubit.dart';
import './Pages/Homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository/api_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryfetchCubit>(
            create: (context) => CountryfetchCubit(
                apiRepository: ApiRepository(apiService: apiService))..fetchCountryAPI()),
        BlocProvider<UniversityCubit>(
            create: (context) => UniversityCubit(
                apiRepository: ApiRepository(apiService: apiService))
              ..fetchUniversityAPI(null)),
      ],
      child: MaterialApp(
        title: 'Notaat',
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Notaat Homepage'),
      ),
    );
  }
}

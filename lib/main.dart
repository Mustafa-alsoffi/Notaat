import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

//*Features
import 'package:notaat/search/search.dart' as search;
import 'package:notaat/authentication/authentication.dart' as auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
   Firebase.initializeApp();
  await auth.DioHelper.init();
  await auth.SharedHelper.initshared();
  var join = auth.SharedHelper.getdata(key: 'join');
  runApp(MyApp(
    apiService: search.ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);
  final search.ApiService apiService;

  @override

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<search.CountryfetchCubit>(
            create: (context) => search.CountryfetchCubit(
                apiRepository: search.ApiRepository(apiService: apiService))..fetchCountryAPI()),
        BlocProvider<search.UniversityCubit>(
            create: (context) => search.UniversityCubit(
                apiRepository: search.ApiRepository(apiService: apiService))
              ..fetchUniversityAPI(null)),
              BlocProvider(create: (context) => auth.NotsCubit()),
      ],
      child: MaterialApp(
        title: 'Notaat',
        debugShowCheckedModeBanner: false,
        home: const search.MyHomePage(title: 'Notaat Homepage'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Pages/Homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notaat',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Notaat Homepage'),
    );
  }
}

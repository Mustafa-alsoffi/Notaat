import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import './UIButton.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [

      ]); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff535050),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
          padding: EdgeInsets.symmetric(vertical: 1.5),
                color: Color(0xff535050),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: SvgPicture.asset(
                  'assets/Background.svg',
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text('Start searching for \nnotes now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 20),
                  DropdownButton(
                    hint: Text(' Choose a country   ',
                        style: TextStyle(color: Colors.white)),
                    items: ['Malaysia', 'Canada', 'United States', 'Yemen']
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  SizedBox(height: 10),
                  DropdownButton(
                    hint: Text(' Choose a university   ',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    items: ['UTM', 'University of AL-Razi', 'UM', 'UCSI']
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Center(
                child: UIButton(
              alignment: Alignment.center,
              color: Color(0xff7B9DCA),
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 50),
            )),
          ],
        ),
        persistentFooterButtons: []);
  }
}

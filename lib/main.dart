import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import './UIButton.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xff535050),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Container(
                  color: Color(0xff535050),
                  width: parentWidth,
                  child: SvgPicture.asset(
                    'assets/Background.svg',
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fitWidth,
                  )),
            ),
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
              text: 'Search',
              textColor: Colors.white,
              alignment: Alignment.center,
              color: Color(0xff7B9DCA),
              height: 40,
              width: null,
              margin: EdgeInsets.symmetric(horizontal: 50),
            )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.bottomLeft,
                child: Text(
                    'Sign up now to start \nsharing, selling and buying notes!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
        persistentFooterButtons: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            UIButton(
              text: 'Login',
              textColor: Colors.white,
              alignment: Alignment.center,
              color: Color(0xff7B9DCA),
              height: 40,
              width: parentWidth * 0.3,
            ),
            SizedBox(width: parentWidth * 0.2),
            UIButton(
              text: 'Sign up',
              textColor: Color(0xff535050),
              alignment: Alignment.center,
              color: Colors.white,
              height: 40,
              width: parentWidth * 0.3,
            )
          ])
        ]);
  }
}

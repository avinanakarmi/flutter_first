import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xff5c6bc0)),
        scaffoldBackgroundColor: Colors.indigo[50],
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Color(0xff616161),
            fontSize: 18,
          ),
          headline5: TextStyle(
            color: Color(0xff616161),
            fontSize: 20,
          ),
          bodyText1: TextStyle(
            color: Color(0xff616161),
            fontSize: 16
          ),
          bodyText2: TextStyle(
            color: Color(0xff757575),
            fontSize: 16
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
          subtitle1: TextStyle(
            color: Color(0xff757575),
            fontSize: 12
          ),
        ),
      ),
      home: const MyHomePage(title: 'Log Your Leaves'),
    );
  }
}

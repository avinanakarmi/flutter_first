import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:first/firebase_options.dart';
import 'package:first/providers/leaves_provider.dart';

import 'screens/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Leaves()),
      ],
      child: const MyApp(),
    ),
  );
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
          bodyText1: TextStyle(color: Color(0xff616161), fontSize: 16),
          bodyText2: TextStyle(color: Color(0xff757575), fontSize: 16),
          button: TextStyle(color: Colors.white, fontSize: 16),
          subtitle1: TextStyle(color: Color(0xff757575), fontSize: 12),
        ),
      ),
      home: const MyHomePage(title: 'Log Your Leaves'),
    );
  }
}

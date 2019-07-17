import 'package:flutter/material.dart';

import './landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25.0,
                ),
                subtitle: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 22.0,
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
              ),
          accentColor: Colors.deepOrange,
          primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
          )),
    );
  }
}

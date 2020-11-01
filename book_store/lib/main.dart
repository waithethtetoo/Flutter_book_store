import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:bookstore/loginPage.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   if (kReleaseMode)
  //     exit(1);
  // };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      home: LoginPage(),
      theme: bookTheme,
    );
  }
}

final ThemeData bookTheme = buildTheme();

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: green600,
      primaryColor: green800,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: grey400,
        colorScheme: base.colorScheme.copyWith(
          secondary: green900,
        ),
      ),
      buttonBarTheme: base.buttonBarTheme.copyWith(
        buttonTextTheme: ButtonTextTheme.accent,
      ),
      scaffoldBackgroundColor: grey350,
      cardColor: green50,
      textSelectionColor: lightGreen600,
      errorColor: errorRed,
      textTheme: buildTextTheme(base.textTheme),
      primaryTextTheme: buildTextTheme(base.primaryTextTheme),
      accentTextTheme: buildTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: grey400),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: green900,
          ),
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
        ),
        border: OutlineInputBorder(),
      ));
}

TextTheme buildTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          bodyText1: base.bodyText1.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ))
      .apply(
        fontFamily: 'Rubik',
        displayColor: green900,
        bodyColor: green900,
      );
}

import 'package:bookstore/home.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final unfocusedColor = Colors.grey[600];
  final nameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Store'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'Book Store',
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'UserName',
                labelStyle: TextStyle(
                    color: nameFocusNode.hasFocus? Theme.of(context).accentColor : unfocusedColor),
              ),
              focusNode: nameFocusNode,
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: passwordFocusNode.hasFocus? Theme.of(context).accentColor: unfocusedColor),
              ),
              focusNode: passwordFocusNode,
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('Login'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  elevation: 4.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                ),
                FlatButton(
                  child: Text('Cancel'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    nameController.clear();
                    passwordController.clear();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

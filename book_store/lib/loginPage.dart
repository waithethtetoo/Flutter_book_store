import 'package:bookstore/profile.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/sign_in.dart';

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
            // TextField(
            //   controller: nameController,
            //   decoration: InputDecoration(
            //     labelText: 'UserName',
            //     labelStyle: TextStyle(
            //         color: nameFocusNode.hasFocus
            //             ? Theme.of(context).accentColor
            //             : unfocusedColor),
            //   ),
            //   focusNode: nameFocusNode,
            // ),
            // SizedBox(height: 12.0),
            // TextField(
            //   controller: passwordController,
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //     labelStyle: TextStyle(
            //         color: passwordFocusNode.hasFocus
            //             ? Theme.of(context).accentColor
            //             : unfocusedColor),
            //   ),
            //   focusNode: passwordFocusNode,
            //   obscureText: true,
            // ),
            ButtonBar(
              children: <Widget>[
                OutlineButton(
                  splashColor: Colors.grey,
                  onPressed: () {
                    SignInWithGoogle().whenComplete(() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.grey),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/google_logo.png"),
                          height: 35.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
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

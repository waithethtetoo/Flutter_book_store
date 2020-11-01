import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _signIn = GoogleSignIn();


String name;
String email;
String imageUrl;

Future<String> SignInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount signInAccount = await _signIn.signIn();
  final GoogleSignInAuthentication authentication =
      await signInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: authentication.accessToken, idToken: authentication.idToken);

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(user.displayName != null);
    assert(user.email != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    if (name.contains("")) {
      name = name.substring(0, name.indexOf(""));
    }
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('SignInWithGoogle succeeded : $user');
    return '$user';
  }
  return null;
}

Future<void> SignOutGoogle() async {
  await _auth.signOut().then((value) {
    _signIn.signOut();
  });
  print("User Sign Out");
}

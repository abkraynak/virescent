import 'package:Virescent/constants/page_titles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/buttons.dart';
import '../constants/page_titles.dart';
import '../constants/positioning.dart';
import 'home.dart';

class EmailLogInPage extends StatefulWidget {
  @override
  _EmailLogInPageState createState() => _EmailLogInPageState();
}

class _EmailLogInPageState extends State<EmailLogInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(PageTitles.emailLogin)),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: Paddings.ver, horizontal: Paddings.hor),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your email address';
                    } else if (!value.contains('@')) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Paddings.ver, horizontal: Paddings.hor),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: TextButton(
                  child: Text('Forgot Password?', style: TextButtons.mainTextStyle,),
                  style: TextButtons.mainButtonStyle,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Paddings.ver, horizontal: Paddings.hor),
                child: isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        child: Text(
                          'Log In',
                          style: ElevatedButtons.mainTextStyle,
                        ),
                        style: ElevatedButtons.mainButtonStyle,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            logInToFb();
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
              )
            ]))));
  }

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(uid: result.user.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}

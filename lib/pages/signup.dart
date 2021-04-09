import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../constants/page_titles.dart';
import '../constants/buttons.dart';
import 'email_login.dart';
import 'email_signup.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(PageTitles.signUp),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Welcome to Virescent',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Let\'s get started!',
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SignInButton(
                      Buttons.Email,
                      text: 'Sign up with Email',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailSignUpPage()),
                        );
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SignInButton(
                      Buttons.Google,
                      text: 'Sign up with Google',
                      onPressed: () {},
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SignInButton(
                      Buttons.Facebook,
                      text: 'Sign up with Facebook',
                      onPressed: () {},
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                        child: Text('Log In Using Email',
                            style: TextButtons.mainTextStyle,),
                        style: TextButtons.mainButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailLogInPage()),
                          );
                        }))
              ]),
        ));
  }
}

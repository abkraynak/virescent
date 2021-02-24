import 'package:flutter/material.dart';
import 'package:Virescent/account.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'logo',
          child: Image.asset('assets/logo-placeholder.png'), // Add image file
      ),
    );

    final inputEmail = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            )
        ),
      ),
    );

    final inputPassword = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            )
        ),
      ),
    );

    final buttonLogin = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.lightGreen,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          onPressed: () => {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Account()))
          },
        ),
      ),
    );

    final buttonForgotPassword = FlatButton(
        child: Text('Forgot Password?', style: TextStyle(color: Colors.grey, fontSize: 20),),
        onPressed: null
    );

    final buttonContinue = FlatButton(
        child: Text('Continue without Account', style: TextStyle(color: Colors.grey, fontSize: 20),),
        onPressed: () => {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Account()))
        }

    );

    return SafeArea(
        child: Scaffold(
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                logo,
                inputEmail,
                inputPassword,
                buttonLogin,
                buttonForgotPassword,
                buttonContinue
              ],
            ),
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/buttons.dart';
import '../constants/text_fields.dart';
import '../constants/page_titles.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email;

  TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  _passwordReset() async {
    try {
      _formKey.currentState.save();
      await _auth.sendPasswordResetEmail(email: _email);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Request Sent'),
              content: Text('An email has been sent to you. Follow the steps to reset your password.'),
              actions: [
                TextButton(
                  child: Text('CLOSE'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } catch(err) {
      print(err);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text('CLOSE'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(PageTitles.forgotpw),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      onSaved: (newEmail) {
                        _email = newEmail;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: '  Email',
                        border: TextFields.mainTextFieldBorderStyle,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      child: Text(
                        'Send Request',
                        style: ElevatedButtons.mainTextStyle,
                      ),
                      style: ElevatedButtons.mainButtonStyle,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          _passwordReset();
                          print(_email);
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                  )
                ]))));
  }
}

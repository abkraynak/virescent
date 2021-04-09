import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/buttons.dart';
import '../constants/text_fields.dart';
import '../constants/page_titles.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  TextEditingController newPassword1Controller = TextEditingController();
  TextEditingController newPassword2Controller = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() {
    user = _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(PageTitles.changepw),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  controller: newPassword1Controller,
                  decoration: InputDecoration(
                    labelText: '  New password',
                    border: TextFields.mainTextFieldBorderStyle,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your new password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  controller: newPassword2Controller,
                  decoration: InputDecoration(
                    labelText: '  New password, again',
                    border: TextFields.mainTextFieldBorderStyle,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your new password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    } else if (value != newPassword1Controller.text) {
                      return 'Passwords must match';
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
                          'Change Password',
                          style: ElevatedButtons.mainTextStyle,
                        ),
                        style: ElevatedButtons.mainButtonStyle,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            changePassword();
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
              )
            ]))));
  }

  void changePassword() async {
    user.updatePassword(newPassword2Controller.text).then((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success!'),
              content: Text('Your password was successfully updated'),
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
    }).catchError((err) {
      print(err.message);
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
    });
  }
}

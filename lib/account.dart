import 'package:Virescent/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:Virescent/login-page.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonLogout = FlatButton(
        child: Text(
          'Logout',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[buttonLogout],
        ),
      ),
      bottomNavigationBar: kBottomBar,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Camera',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

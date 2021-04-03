import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  final String title = "Change Password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
    );
  }
}

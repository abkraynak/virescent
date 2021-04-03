import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text('This is the NEW settings page'),
                      ),
                      Center(
                        child: Text('Second line of text'),
                      ),
                    ]))));
  }
}

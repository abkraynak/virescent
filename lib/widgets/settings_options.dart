import 'package:flutter/material.dart';

import '../pages/change_pw.dart';

class SettingsOptions extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
            child: ListTile(
                leading: const Icon(Icons.security),
                title: const Text('Change password'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordPage()));
                })),
        SwitchListTile(
          value: false,
          title: Text('Option 2'),
          onChanged: (value) {},
        ),
        SwitchListTile(
          value: true,
          title: Text('Option 3'),
          subtitle: Text('Description'),
          onChanged: (value) {},
        ),
        CheckboxListTile(
            value: true, title: Text('Option 4'), onChanged: (value) {}),
        Card(
            child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {})),
      ],
    );
  }
}

import 'package:Virescent/pages/about.dart';
import 'package:Virescent/pages/help_center.dart';
import 'package:flutter/material.dart';

import '../pages/change_name.dart';
import '../pages/change_pw.dart';
import '../pages/about.dart';

class SettingsOptions extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
            child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Change name'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeNamePage()));
                })),
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
        /*
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
         */
        Card(
            child: ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help Center'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpCenterPage()));
                })),
        Card(
            child: ListTile(
                leading: const Icon(Icons.emoji_events_rounded),
                title: const Text('About Virescent'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutPage()));
                })),
      ],
    );
  }
}

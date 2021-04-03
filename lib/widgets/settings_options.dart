import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Option 1'),
          subtitle: Text('Description'),
          onTap: () {},
        ),
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
      ],
    );
  }
}

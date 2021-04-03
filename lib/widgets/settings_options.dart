import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Change password'),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Change password"),
                    content: Text("Enter new password"),
                    actions: [
                      FlatButton(
                        child: Text("CANCEL"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text("SUBMIT"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
          )
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

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';

Future<String> getBalance() async {
  String result = (await FirebaseDatabase.instance
          .reference()
          .child("users/testuser/balance")
          .once())
      .value;
  print(result);
  return result;
}

class AccountInfo extends StatefulWidget {
  AccountInfo({this.app});
  final FirebaseApp app;

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final dbRef = FirebaseDatabase.instance
      .reference()
      .child("users")
      .child("testuser")
      .child("balance");
  int balance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: dbRef.once(),
        builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            balance = snapshot.data.value;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(balance.toString(), style: TextStyle(fontSize: 26),),
                          subtitle: Text("My Balance"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('INFO'),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, RouteNames.camera);
        },
        child: Icon(Icons.camera_alt_rounded, color: ThemeColors.fabIcon),
        backgroundColor: ThemeColors.fab,
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';


Future<String> getBalance() async {
  User user = FirebaseAuth.instance.currentUser;
  String uid = user.uid;
  String result = (await FirebaseDatabase.instance
          .reference()
          .child('users/$uid/balance')
          .once())
      .value;
  print(result);
  return result;
}

class AccountInfo extends StatefulWidget {
  /*
  AccountInfo({this.app, this.uid, this.balance});
  final FirebaseApp app;
  final String uid;
  final String balance;


   */
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  String uid;
  int balance;
  String bal;


  @override
  void initState() {

    super.initState();
    initUser();
  }

  initUser() async {
    bal = await getBalance();
    //print(bal);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseDatabase.instance
            .reference()
            .child('users').child('testuser').child('balance').once(),
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
                          title: Text(bal, style: TextStyle(fontSize: 26),),
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

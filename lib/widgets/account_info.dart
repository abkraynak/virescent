import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants/buttons.dart';
import '../constants/colors.dart';
import '../constants/positioning.dart';
import '../constants/route_names.dart';

Future<String> getBalance() async {
  User user = FirebaseAuth.instance.currentUser;
  String uid = user.uid;
  String result = (await FirebaseDatabase.instance
          .reference()
          .child('users/$uid/balance')
          .once())
      .value;
  return result;
}

class AccountInfo extends StatefulWidget {
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  int balance;
  String bal;

  @override
  void initState() {
    super.initState();
    getBal();
  }

  getBal() async {
    bal = await getBalance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(padding: EdgeInsets.symmetric(
            vertical: 40, horizontal: Paddings.hor),
            child: Center(child: Text('Hello, !', style: TextStyle(fontSize: 26),),)),
        FutureBuilder(
          future: FirebaseDatabase.instance
              .reference()
              .child('users')
              .child('testuser')
              .child('balance')
              .once(),
          builder:
              (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
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
                            title: Text(
                              bal,
                              style: TextStyle(fontSize: 26),
                            ),
                            subtitle: Text("My Balance"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('INFO'),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Your balance'),
                                          content: Text(
                                              'You can earn points by submitting photos of your recycling. '
                                              'If you have just submitted a photo, please refresh the page to view your updated balance. '
                                              'Points can be used to redeem rewards on the Rewards page. '),
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
                                },
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
        Padding(padding: EdgeInsets.symmetric(
            vertical: 40, horizontal: Paddings.hor),
            child: Container()),
        Padding(padding: EdgeInsets.symmetric(
            vertical: Paddings.ver, horizontal: Paddings.hor),
            child: Center(child: Text('Need help getting started?', style: TextStyle(fontSize: 20),),)),
        Padding(padding: EdgeInsets.symmetric(
            vertical: Paddings.ver, horizontal: Paddings.hor),
            child: Center(child: Text('Use the Camera to submit a photo', style: TextStyle(fontSize: 16),),)),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Paddings.ver, horizontal: Paddings.hor),
          child: ElevatedButton(
            child: Text('Help Center',
                style: ElevatedButtons.mainTextStyle),
            style: ElevatedButtons.mainButtonStyle,
            onPressed: () {

            },
          ),
        ),
      ]),
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

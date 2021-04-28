import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/positioning.dart';
import '../constants/route_names.dart';

class AccountInfo extends StatefulWidget {
  AccountInfo({ this.app });
  final FirebaseApp app;

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final referenceDb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = referenceDb.reference();
    return Scaffold(
      body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Paddings.ver, horizontal: Paddings.hor),
              child: Text('My Balace: '),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Paddings.ver, horizontal: Paddings.hor),
              child: Text('My Posts: '),
            ),
          ],
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
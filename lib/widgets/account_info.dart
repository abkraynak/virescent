import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is the Account page'),
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
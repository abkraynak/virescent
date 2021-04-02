import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      pageTitle: PageTitles.camera,
      body: Center(
        child: Text('This is the camera page'),
      ),
    );
  }
}
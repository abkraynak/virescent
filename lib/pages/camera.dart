import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/camera_interface.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.camera,
      body: CameraInterface(),
    );
  }
}
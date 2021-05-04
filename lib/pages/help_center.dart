import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/about_app.dart';

class HelpCenterPage extends StatefulWidget {
  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(PageTitles.helpcenter),
        ),
        body: AboutApp()
    );
  }
}

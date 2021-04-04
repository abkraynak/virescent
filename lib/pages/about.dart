import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/about_app.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(PageTitles.about),
    ),
    body: AboutApp()
  );
  }
  }

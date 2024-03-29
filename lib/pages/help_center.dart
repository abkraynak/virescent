import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/help_center_list.dart';

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
        body: FAQList(),
    );
  }
}

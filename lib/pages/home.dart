import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';



class HomePage extends StatelessWidget {
  HomePage({this.uid});
  final String uid;


  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      pageTitle: PageTitles.home,
      body: Center(
        child: Text('This is the home page'),
      ),
    );
  }
}
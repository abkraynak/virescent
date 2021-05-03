import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/account_info.dart';
import '../widgets/app_scaffold.dart';

class HomePage extends StatelessWidget {
  HomePage({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.home,
      body: AccountInfo(),
    );
  }
}
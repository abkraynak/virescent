import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/account_info.dart';
import '../widgets/app_scaffold.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.account,
      body: AccountInfo()
    );
  }
}
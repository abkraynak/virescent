import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/rewards_list.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        pageTitle: PageTitles.rewards,
        body: RewardsList()
    );
  }
}

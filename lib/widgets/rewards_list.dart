import 'package:flutter/material.dart';

import '../widgets/rewards_card.dart';

class RewardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      RewardsCard(),
      RewardsCard(),
      RewardsCard(),
      RewardsCard(),
      RewardsCard(),
      RewardsCard(),
      RewardsCard(),
    ]);
  }
}

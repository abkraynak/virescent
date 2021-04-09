import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';
import '../widgets/rewards_card.dart';

class RewardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        RewardsCard(),
        RewardsCard(),
        RewardsCard(),
        RewardsCard(),
        RewardsCard(),
        RewardsCard(),
        RewardsCard(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, RouteNames.camera);
        },
        child: Icon(Icons.camera_alt_rounded, color: ThemeColors.fabIcon),
        backgroundColor: ThemeColors.fab,
      ),
    );
  }
}

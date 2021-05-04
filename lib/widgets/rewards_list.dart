import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';
import '../models/rewards.dart';
import '../widgets/rewards_card.dart';

class RewardListItem {
  String company;
  String cost;
  String description;
  String redeemed;
  String title;
  RewardListItem({ this.company, this.cost, this.description, this.redeemed, this.title });
}

class RewardList{
  List<RewardListItem> rewardList;
  RewardList({ this.rewardList });
}

final dbRef = FirebaseDatabase.instance.reference();

class DBServ {
  static Future<List<RewardDB>> getRewards() async {
    Query rewardSnapshot = await FirebaseDatabase.instance
        .reference()
        .child("rewards")
        .orderByKey();

    print(rewardSnapshot); // to debug and see if data is returned
    print('here/n');

    List<RewardDB> rewards = [];
/*
    Map<dynamic, dynamic> values = needsSnapshot.path.value;
    values.forEach((key, values) {
      rewards.add(RewardDB.fromSnapshot(values));
    });

 */

    return rewards;
  }
}

class RewardsList extends StatefulWidget {
  @override
  _RewardsListState createState() => _RewardsListState();
}

class _RewardsListState extends State<RewardsList> {
  List<RewardDB> _rewards = [];

  @override
  void initState(){
    super.initState();
    _setupRewards();
  }

  _setupRewards() async {
    List<RewardDB> rewards = await DBServ.getRewards();
    setState(() {
      _rewards = rewards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _rewards.length,
          itemBuilder: (BuildContext context, int index) {
            RewardDB reward = _rewards[index];
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('Reward'),
                    subtitle: Text('This is the description of the reward'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('REDEEM'),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            );
          }
      ),
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

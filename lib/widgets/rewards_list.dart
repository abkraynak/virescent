import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';
import '../models/rewards.dart';
//import '../widgets/rewards_card.dart';

class RewardListItem {
  String id;
  String company;
  String cost;
  String description;
  String redeemed;
  RewardListItem(
      {this.id, this.company, this.cost, this.description, this.redeemed});

  RewardListItem.map(dynamic obj) {
    this.id = obj['id'];
    this.company = obj['company'];
    this.cost = obj['cost'];
    this.description = obj['description'];
    this.redeemed = obj['redeemed'];
  }
  /*
  String get _id => id;
  String get _company => company;
  String get _cost => cost;
  String get _description => description;
  String get _redeemed => redeemed;

   */

  RewardListItem.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    company = snapshot.value['company'];
    cost = snapshot.value['cost'];
    description = snapshot.value['description'];
    redeemed = snapshot.value['redeemed'];
  }
}
/*
class RewardList {
  List<RewardListItem> rewardList;
  RewardList({this.rewardList});

  factory RewardList.fromJSON(Map<dynamic, dynamic> json) {
    return RewardList(rewardList: parserewards(json));
  }

  static List<RewardListItem> parserewards(rewardJSON) {
    var rList = rewardJSON['browseRewards'] as List;
    List<RewardListItem> rewardList =
        rList.map((data) => RewardListItem.fromJson(data)).toList();
    return rewardList;
  }
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

 */

class RewardsList extends StatefulWidget {
  @override
  _RewardsListState createState() => _RewardsListState();
}

final rewardsReference = FirebaseDatabase.instance.reference().child('rewards');

class _RewardsListState extends State<RewardsList> {
  List rewards;
  StreamSubscription _onRewardAddedSubscription;
  StreamSubscription _onRewardChangedSubscription;
  
  @override
  void initState() {
    super.initState();
    rewards = new List();
    _onRewardAddedSubscription = rewardsReference.onChildAdded.listen(_onRewardAdded);
  }
/*
  _setupRewards() async {
    List<RewardDB> rewards = await DBServ.getRewards();
    setState(() {
      _rewards = rewards;
    });
  }
  
 */

  void _onRewardAdded(Event event){
    setState(() {
      rewards.add(new RewardListItem.fromSnapshot(event.snapshot));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: rewards.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('${rewards[index].company}'),
                      subtitle: Text('${rewards[index].description}'),
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
              ),
            ]);
          }),
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

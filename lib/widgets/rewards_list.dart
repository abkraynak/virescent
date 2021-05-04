import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';

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

  RewardListItem.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    company = snapshot.value['company'];
    cost = snapshot.value['cost'];
    description = snapshot.value['description'];
    redeemed = snapshot.value['redeemed'];
  }
}

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
    _onRewardAddedSubscription =
        rewardsReference.onChildAdded.listen(_onRewardAdded);
  }

  void _onRewardAdded(Event event) {
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
              rewards[index].redeemed == 'false'
                  ? Card(
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
                              Text('${rewards[index].cost}' ' pts '),
                              TextButton(
                                child: const Text('REDEEM'),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text('${rewards[index].company}', style: TextStyle(color: Colors.grey)),
                            subtitle: Text('${rewards[index].description}', style: TextStyle(color: Colors.grey)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('${rewards[index].cost}' ' pts ', style: TextStyle(color: Colors.grey)),
                              TextButton(
                                child: const Text('REDEEM', style: TextStyle(color: Colors.grey)),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    )
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

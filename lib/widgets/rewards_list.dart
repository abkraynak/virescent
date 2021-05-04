import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RewardListItem {
  String id;
  String company;
  String cost;
  String description;
  String display;
  String redeemed;
  String canredeem;
  String status;
  String redemptions;

  RewardListItem(
      {this.id,
      this.company,
      this.cost,
      this.description,
      this.display,
      this.redeemed,
      this.canredeem,
      this.status,
      this.redemptions});

  RewardListItem.map(dynamic obj) {
    this.id = obj['id'];
    this.company = obj['company'];
    this.cost = obj['cost'];
    this.description = obj['description'];
    this.display = obj['display'];
    this.redeemed = obj['redeemed'];
    this.canredeem = obj['canredeem'];
    this.status = obj['status'];
    this.redemptions = obj['redemptions'];
  }

  RewardListItem.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    company = snapshot.value['company'];
    cost = snapshot.value['cost'];
    description = snapshot.value['description'];
    display = snapshot.value['display'];
    redeemed = snapshot.value['redeemed'];
    canredeem = snapshot.value['canredeem'];
    status = snapshot.value['status'];
    redemptions = snapshot.value['redemptions'];
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
    _onRewardChangedSubscription =
        rewardsReference.onChildChanged.listen(_onRewardUpdated);
  }

  void _onRewardAdded(Event event) {
    setState(() {
      rewards.add(new RewardListItem.fromSnapshot(event.snapshot));
    });
  }

  void _onRewardUpdated(Event event) {
    var oldRewardValue =
        rewards.singleWhere((reward) => reward.id == event.snapshot);
    setState(() {
      rewards[rewards.indexOf(oldRewardValue)] =
          new RewardListItem.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: rewards.length,
          itemBuilder: (context, index) {
            return Column(children: [
              rewards[index].display == 'true'
                  ? rewards[index].canredeem == 'true'
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
                                title: Text('${rewards[index].company}',
                                    style: TextStyle(color: Colors.grey)),
                                subtitle: Text('${rewards[index].description}',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text('${rewards[index].cost}' ' pts ',
                                      style: TextStyle(color: Colors.grey)),
                                  TextButton(
                                    child: Text('${rewards[index].status}',
                                        style: TextStyle(color: Colors.grey)),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          ),
                        )
                  : Container(),
            ]);
          }),
    );
  }
}

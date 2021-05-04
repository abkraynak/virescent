import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getBalance() async {
  User user = FirebaseAuth.instance.currentUser;
  String uid = user.uid;
  String result = (await FirebaseDatabase.instance
          .reference()
          .child('users/$uid/balance')
          .once())
      .value;
  return result;
}

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
  String bal;
  StreamSubscription _onRewardAddedSubscription;
  StreamSubscription _onRewardChangedSubscription;

  @override
  void initState() {
    super.initState();
    getBal();
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

  getBal() async {
    bal = await getBalance();
    setState(() {});
  }

  setBal() async {
    User user = FirebaseAuth.instance.currentUser;
    String uid = user.uid;
    await FirebaseDatabase.instance.reference().child('users/$uid').update({
      "balance": bal,
    });
  }

  redeem(int index) {
    var balint = int.parse(bal);
    var cost = int.parse(rewards[index].cost);
    var success = false;
    setState(() {
      if (balint >= cost) {
        balint = balint - cost;
        bal = balint.toString();
        setBal();
        success = true;
      }
    });
    if (success == true) {
      return true;
    } else {
      return false;
    }
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
                                    onPressed: () {
                                      redeem(index) == true
                                          ? showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Success'),
                                                  content: Text(
                                                      'Your reward redemption will be sent to your email address.'),
                                                  actions: [
                                                    TextButton(
                                                      child: Text('CLOSE'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )
                                                  ],
                                                );
                                              })
                                          : showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Insufficent balance'),
                                                  content: Text(
                                                      'This reward cannot be redeemed because your balance is not high enough.'),
                                                  actions: [
                                                    TextButton(
                                                      child: Text('CLOSE'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )
                                                  ],
                                                );
                                              });
                                    },
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

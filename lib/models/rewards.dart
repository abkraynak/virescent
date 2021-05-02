import 'package:firebase_database/firebase_database.dart';

class RewardDB {
  final String id;
  final String company;
  final String cost;
  final String description;
  final String redeemed;
  final String title;

  RewardDB({
    this.id,
    this.company,
    this.cost,
    this.description,
    this.redeemed,
    this.title,
  });
  RewardDB.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        company = snapshot.value["company"],
        cost = snapshot.value["cost"],
        description = snapshot.value["description"],
        redeemed = snapshot.value["redeemed"],
        title = snapshot.value["title"];
  toJson(){
    return {
      "company": company,
      "cost": cost,
      "description": description,
      "redeemed": redeemed,
      "title": title,
    };
  }
}

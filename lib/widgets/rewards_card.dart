import 'package:flutter/material.dart';




class RewardsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
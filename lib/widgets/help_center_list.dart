import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FAQ {
  String id;
  String question;
  String answer;

  FAQ(
      {this.id,
        this.question,
        this.answer,
        });

  FAQ.map(dynamic obj) {
    this.id = obj['id'];
    this.question = obj['question'];
    this.answer = obj['answer'];
  }

  FAQ.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    question = snapshot.value['question'];
    answer = snapshot.value['answer'];
  }
}

class FAQList extends StatefulWidget {
  @override
  _FAQListState createState() => _FAQListState();
}

final FAQReference = FirebaseDatabase.instance.reference().child('faq');

class _FAQListState extends State<FAQList> {
  List faq;
  StreamSubscription _onFAQAddedSubscription;
  StreamSubscription _onFAQChangedSubscription;

  @override
  void initState() {
    super.initState();
    faq = new List();
    _onFAQAddedSubscription =
        FAQReference.onChildAdded.listen(_onFAQAdded);
    _onFAQChangedSubscription =
        FAQReference.onChildChanged.listen(_onFAQUpdated);
  }

  void _onFAQAdded(Event event) {
    setState(() {
      faq.add(new FAQ.fromSnapshot(event.snapshot));
    });
  }

  void _onFAQUpdated(Event event) {
    var oldFAQValue =
    faq.singleWhere((faq) => faq.id == event.snapshot);
    setState(() {
      faq[faq.indexOf(oldFAQValue)] =
      new FAQ.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: faq.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('${faq[index].question}'),
                      subtitle: Text('${faq[index].answer}'),
                    ),
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}

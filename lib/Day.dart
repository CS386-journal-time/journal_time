import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'JournalEntry.dart';
import 'main.dart';
import 'dart:io';


class Day extends StatelessWidget {
  final DateTime choiceDay;
  String journalText;
  File image;

  Day({this.choiceDay, this.journalText});

  String checkJournalText() {
    if (journalText == null) {
      journalText = 'Enter your thoughts...';
    }
    return journalText;
  }

  String formatDate() {
    DateFormat formatter = DateFormat('LLLL d, y');
    String formatted = formatter.format(choiceDay);
    return '$formatted';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(formatDate()),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(checkJournalText()),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                    builder: (context) => HomePage(),
                  );
                  Navigator.push(context, route);
                },
                child: Text('Return to Calendar'),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                    builder: (context) => JournalEntry(
                        choiceDay: choiceDay, journalText: journalText),
                  );
                  Navigator.push(context, route);
                },
                child: Text('Edit Journal'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

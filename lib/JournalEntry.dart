import 'package:flutter/material.dart';
import 'Day.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Photo.dart';


class JournalEntry extends StatelessWidget {
  DateTime choiceDay;
  String journalText;

  JournalEntry({this.choiceDay, this.journalText});

  String formatDate() {
    DateFormat formatter = DateFormat('LLLL d, y');
    String formatted = formatter.format(choiceDay);
    return '$formatted';
  }

  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
  }


  // text input
  Widget textBox() {
    final int maxLine = 30;
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      height: maxLine * 8.0,
      child: TextField(
        controller: myController,
        keyboardType: TextInputType.multiline,
        maxLines: maxLine,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Journal Time',
          ),
      ),
    );
  }


  // scrollable image container
  Widget imageList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
      height: 160,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Photo(),
          Photo(),
          Photo(),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(formatDate()),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
               textBox(),
              imageList(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Route route = MaterialPageRoute(
            builder: (context) => Day(
              choiceDay: choiceDay, journalText: journalText),
          );
          Navigator.push(context, route);
          },
        label: Text('Save'),
        icon: Icon(FontAwesomeIcons.save),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:journal_time1/customColor.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Day.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  final MaterialColor appColor;
  MyApp({Key key, this.appColor}) : super (key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(

        primarySwatch: appColor,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  final Color appColor;
  HomePage({Key key, this.appColor}) : super (key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;
  DateTime choiceDay;

  Color appColor;


  void displayChoiceDay() {
    print(choiceDay);
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
           child: Text('Journal Time'),
        ),
        backgroundColor: widget.appColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.orange[400],
                  selectedColor: Theme
                      .of(context)
                      .primaryColor,
                  todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
              ),
              startingDayOfWeek: StartingDayOfWeek.sunday,
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) =>
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
              ),
              onCalendarCreated: (date, now, month) {
                choiceDay = DateTime.now();
              },
              onDaySelected: (date, events) {
                choiceDay = date;
              },
              calendarController: _controller,
            ),
            SizedBox(
              height: 20,
            ),
            Center(

              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Route route = MaterialPageRoute(
                        builder: (context) => Day(choiceDay: choiceDay),
                      );
                      Navigator.push(context, route);
                    },
                    child: Text('Go to Journal'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Route route = MaterialPageRoute(
                        builder: (context) => customColor(),
                      );
                      Navigator.push(context, route);
                    },
                    child: Text('Customize'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

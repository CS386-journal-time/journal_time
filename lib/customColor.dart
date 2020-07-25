import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:journal_time1/main.dart';


class customColor extends StatefulWidget {

  @override
  _customColor createState() => _customColor();
}

class _customColor extends State<customColor> {

  Color appColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('color'),
        backgroundColor: appColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: RaisedButton(
                  onPressed: () {
                  Route route = MaterialPageRoute(
                  builder: (context) => HomePage(appColor: appColor,),
                  );
                  Navigator.push(context, route);
                  },
                  child: Text('Apply Color Changes'),
                ),

            ),

            new ColorPicker(
                color: Colors.blue,
                onChanged: (value){
                  setState(() {
                    appColor = value;
                  });
                }
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';

class mapFeature extends StatefulWidget {

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<mapFeature> {
  static File _map;
  final picker = _LocationPicker();

  setState(() {
  _map = File(picker.path);
  });


  Future _LocationPicker() async {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Leaflet Maps')),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(40.71, -74.00), minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(40.73, -74.00),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
              ])
            ]));
  }
}

Widget mapCard(File localImage) {
  return Container(
    width: 240.0,
    child: GestureDetector(
      //onTap: showAlertDialog,
      child: Container(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.grey[400],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            child: localImage == null
                ? Icon(FontAwesomeIcons.image)
                : Image.file(localImage, fit: BoxFit.cover,),
          ),
        ),
      ),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return mapCard(_map);
}




import 'package:flutter/material.dart';
import 'Day.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


class JournalEntry extends StatelessWidget {
  DateTime choiceDay;
  String journalText;
  File image;
  final myController = TextEditingController();
  var photo = Photo();

  JournalEntry({this.choiceDay, this.journalText});

  String formatDate() {
    DateFormat formatter = DateFormat('LLLL d, y');
    String formatted = formatter.format(choiceDay);
    return '$formatted';
  }

  void dispose() {
    myController.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(formatDate()),
      ),
      body: Column(
        children: <Widget>[
          textBox(),
          photo.createElement().build(),
          photo.createElement().build(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Route route = MaterialPageRoute(
            builder: (context) => Day(
              choiceDay: choiceDay, journalText: myController.text, ),
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


class Photo extends StatefulWidget {
  @override
  PhotoState createState() => PhotoState();
}

class PhotoState extends State<Photo> {
  File _image;
  final picker = ImagePicker();

  Future _getImageGallery() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      print('File: $_image');
    });
  }

  File getImage()
  {
    return _image;
  }
  
  Widget imageGrid() {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      crossAxisCount: 3,
      children: <Widget>[
        GestureDetector(
          onTap: _getImageGallery,
          child: Container(
            color: Colors.grey[400],
            child: _image == null ? Icon(FontAwesomeIcons.camera) : Image.file(_image),
          ),
        ),
        GestureDetector(
          onTap: _getImageGallery,
          child: Container(
            color: Colors.grey[400],
            child: _image == null ? Icon(FontAwesomeIcons.camera) : Image.file(_image),
          ),
        ),
        GestureDetector(
          onTap: _getImageGallery,
          child: Container(
            color: Colors.grey[400],
            child: _image == null ? Icon(FontAwesomeIcons.camera) : Image.file(_image),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageGrid();
  }
}

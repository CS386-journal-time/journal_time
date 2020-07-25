import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Photo extends StatefulWidget {
  @override
  _Photo createState() => _Photo();
}

class _Photo extends State<Photo> {
  File _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
     final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 100, 40, 0),
        alignment: Alignment.center,
        child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  color: Colors.grey,
                  padding: EdgeInsets.all(60),
                  child: _image == null
                    ? Text('Tap to select an image.')
                    : Image.file(_image),
                ),
                onTap: getImageGallery,
              ),
              RaisedButton(
                onPressed: () {},
                  child: Text('Submit'),
              ),
            ],
        )
        ),
    );
  }
}
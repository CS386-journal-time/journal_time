import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class Photo extends StatefulWidget {

  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  File _image;
  final picker = ImagePicker();


  Future _getImageGallery() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);;
    });
  }

  // container for selected image
  Widget imageCard(File image) {
      return Container(
      width: 240.0,
      child: GestureDetector(
        onTap: _getImageGallery,
        child: Container(
          child: Card(
            color: Colors.grey[400],
            child: Container(
              alignment: Alignment.center,
              child: image == null
                  ? Icon(FontAwesomeIcons.image)
                  : Image.file(image),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageCard(_image);
  }
}
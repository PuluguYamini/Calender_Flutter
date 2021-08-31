import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImage extends StatefulWidget {
  @override
  _GetImageState createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  XFile? _image;
  Future<void> getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker Example'),
        ),
        body: Center(
          child: _image == null
              ? Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => getImage(),
                        child: Text('No image selected.'),
                      ),
                      Container(height: 40.0),
                    ],
                  ),
                )
              : Container(
            padding: EdgeInsets.all(20),
                  child: Image.file(File(_image!.path),
                  fit: BoxFit.cover,
                )),
        ));
  }
}

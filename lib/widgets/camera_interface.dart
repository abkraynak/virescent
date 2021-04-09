import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/buttons.dart';
import '../constants/positioning.dart';


class CameraInterface extends StatefulWidget {
  @override
  _CameraInterfaceState createState() => _CameraInterfaceState();
}

class _CameraInterfaceState extends State<CameraInterface> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  pickGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Paddings.ver, horizontal: Paddings.hor),
                ),
                Center(
                  child: _loading
                      ? Container(
                          width: 350,
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/recycle_sign.png'),
                              SizedBox(height: 50),
                            ],
                          ),
                        )
                      : Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 250,
                                child: Image.file(_image),
                              ),
                              SizedBox(height: 20),
                              _output != null
                                  ? Text(
                                      '${_output[0]['label']}',
                                      style: TextStyle(
                                          color: Colors.orange, fontSize: 15),
                                    )
                                  : Container(),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Paddings.ver, horizontal: Paddings.hor),
                        child: ElevatedButton(
                          child: Text('Capture Image', style: ElevatedButtons.mainTextStyle),
                          style: ElevatedButtons.mainButtonStyle,
                          onPressed: () { getImage(); },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Paddings.ver, horizontal: Paddings.hor),
                        child: ElevatedButton(
                          child: Text('Select Image', style: ElevatedButtons.mainTextStyle),
                          style: ElevatedButtons.mainButtonStyle,
                          onPressed: () { pickGalleryImage(); },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Paddings.ver, horizontal: Paddings.hor),
                ),
              ],
            )));
  }
}

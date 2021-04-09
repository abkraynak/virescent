import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';


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
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Virescent',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text('Recycle Bin Classifier',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    )),
                SizedBox(height: 50),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 250,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Capture a Image',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          pickGalleryImage();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 250,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Select a Image',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

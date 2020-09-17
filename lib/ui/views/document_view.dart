import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class DocumentsView extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<DocumentsView> {
  //File file = await FilePicker.getFile();

  String _filePath;

  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath(type: FileType.any);
      if (filePath == '') {
        return;
      }
      print("File path: " + filePath);
      setState((){this._filePath = filePath;});
    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }


  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery
        .of(context)
        .size
        .aspectRatio;
    print("aspectRatio: $aspectRatio");
    return Scaffold(
      backgroundColor: widgetBgColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: widgetLightGreyColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: widgetGreyColor, //change your color hereacrd flutte
        ),
        title: Text(
          "Documents",
          style: TextStyle(color: textColorWhite),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            child: Card(
              color: widgetLightGreyColor1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('Upload CV',style: textStyle,),
                    subtitle: Text('Select File'),
                  ),
                ],
              ),
            ),
            onTap: getImage,

          ),
          InkWell(
            child: Card(
              color: widgetLightGreyColor1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('Upload Photo',style: textStyle,),
                    subtitle: Text('Select File'),
                  ),
                ],
              ),
            ),
            onTap: getFilePath,
          ),
        ],
      ),
    );
  }
}

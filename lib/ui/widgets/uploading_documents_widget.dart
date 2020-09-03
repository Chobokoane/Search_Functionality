import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UploadingDocuments extends StatelessWidget {
  //File file = await FilePicker.getFile();
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
          color: widgetGreyColor, //change your color here
        ),
        title: Text(
          "Qualifications",
          style: TextStyle(color: textColorWhite),
        ),
      ),
      body: Column(
        children: [
          Card()
        ],
      ),
    );
  }
}

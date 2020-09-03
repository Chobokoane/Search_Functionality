import 'package:filter/core/viewmodels/qualifications_viewmodel.dart';
import 'package:filter/core/viewmodels/register_viewmodel.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/add_qualification_content.dart';
import 'package:filter/ui/widgets/register_content.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class AddQualificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BaseView<QualificationsViewModel>(onModelReady: (model) {
      model.init();
//      model.navigateToHome = (userObj) {
//        Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false, arguments: userObj);
//      };
    }, builder: (BuildContext context, QualificationsViewModel model, Widget child) {
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
            "Add Qualification",
            style: TextStyle(color: textColorWhite),
          ),
        ),
        body: ListView(
          children: <Widget>[
            UIHelper.verticalSpaceMedium(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                alignment: Alignment.center,
                child: AddQualificationWidget(
                  nameController: model.nameController,
                  institutionNameController: model.institutionNameController,
                  yearController: model.yearController,
                  errorMessage: model.errorMessage,
                  state: model.state,

                )),
          ],
        ),
      );
    });
  }
}

import 'package:filter/core/viewmodels/register_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/register_content.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BaseView<RegisterModel>(onModelReady: (model) {
      model.init();
//      model.navigateToHome = (userObj) {
//        Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false, arguments: userObj);
//      };
    }, builder: (BuildContext context, RegisterModel model, Widget child) {
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
            "Register",
            style: TextStyle(color: textColorWhite),
          ),
        ),
        body: ListView(
          children: <Widget>[
            UIHelper.verticalSpaceMedium(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                alignment: Alignment.center,
                child: RegisterContent(
                  firstNameController: model.firstNameController,
                  lastNameController: model.lastNameController,
                  emailController: model.emailController,
                  cellNumberController: model.cellNumberController,
                  passwordController: model.passwordController,
                  verifyPasswordController: model.verifyPasswordController,
                  termsController: model.termsController,
                  errorMessage: model.errorMessage,
                  state: model.state,
                  onClickSignUp: () {
                    model.register();
                  },
                )),
          ],
        ),
      );
    });
  }
}

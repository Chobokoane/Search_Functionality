import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/plain_text_field.dart';
import 'package:flutter/material.dart';
import 'plain_text_field.dart';

class AddQualificationWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController institutionNameController;
  final TextEditingController yearController;

  final String errorMessage;
  final ViewState state;
  final Function onClickSignUp;

  const AddQualificationWidget(
      {Key key,
        this.nameController,
        this.institutionNameController,
        this.yearController,

        this.errorMessage,
        this.state,
        this.onClickSignUp, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PlainTextField(
          controller: nameController,
          hint: "Qualification Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: institutionNameController,
          hint: "Institution Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: yearController,
          hint: "Year Obtained*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceLarge(),
        UIHelper.verticalSpaceLarge(),
        UIHelper.verticalSpaceLarge(),
        UIHelper.verticalSpaceLarge(),
        UIHelper.verticalSpaceLarge(),
        UIHelper.verticalSpaceLarge(),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: widgetLightGreyColor1,
          child: Text("Save",style: greyText,),
          onPressed: (){

          },
        ),
      ],
    );
  }
}

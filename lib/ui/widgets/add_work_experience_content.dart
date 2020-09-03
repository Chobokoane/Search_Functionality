import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/plain_text_field.dart';
import 'package:flutter/material.dart';
import 'plain_text_field.dart';

class AddWorkExperienceWidget extends StatelessWidget {
  final TextEditingController employeeNameController;
  final TextEditingController jobTitleController;
  final TextEditingController durationController;

  final String errorMessage;
  final ViewState state;
  final Function onClickSignUp;

  const AddWorkExperienceWidget(
      {Key key,

        this.errorMessage,
        this.state,
        this.onClickSignUp, this.employeeNameController, this.jobTitleController, this.durationController, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PlainTextField(
          controller: employeeNameController,
          hint: "Employee Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: jobTitleController,
          hint: "Job Title*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: durationController,
          hint: "Duration*",
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
          color: widgetGreyColor,
          child: Text("Save",style: greyText,),
          onPressed: (){

          },
        ),
      ],
    );
  }
}

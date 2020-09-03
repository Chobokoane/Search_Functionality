import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/plain_text_field.dart';
import 'package:filter/ui/widgets/padding_divider.dart';
import 'package:flutter/material.dart';
import 'cell_text_field.dart';
import 'email_text_field.dart';
import 'labelled_check_box_widget.dart';
import 'password_text_field.dart';
import 'plain_text_field.dart';

class RegisterContent extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController cellNumberController;
  final TextEditingController passwordController;
  final TextEditingController verifyPasswordController;
  final TextEditingController termsController;
  final TextEditingController idNumber;
  final TextEditingController registrationNumber;
  final TextEditingController occupation;
  final String errorMessage;
  final ViewState state;
  final Function onClickSignUp;

  const RegisterContent(
      {Key key,
        this.firstNameController,
        this.lastNameController,
        this.emailController,
        this.cellNumberController,
        this.passwordController,
        this.verifyPasswordController,
        this.termsController,
        this.errorMessage,
        this.state,
        this.onClickSignUp, this.idNumber, this.registrationNumber, this.occupation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PlainTextField(
          controller: firstNameController,
          hint: "First Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: lastNameController,
          hint: "Last Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        EmailTextField(
          controller: emailController,
          hint: "Email Address*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        CellTextField(
          controller: cellNumberController,
          hint: "Cellphone Number*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: lastNameController,
          hint: "Last Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: idNumber,
          hint: "ID No.:*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: registrationNumber,
          hint: "Registration No.:*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: occupation,
          hint: "occupation.:*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PasswordTextField(
          controller: passwordController,
          hint: "Password*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PasswordTextField(
          controller: verifyPasswordController,
          hint: "Confirm Password*",
          horizontalPadding: 0,
        ),

        FlatButton(
            child: Text('View T\'s & C\'s',
                style: greyText),
            onPressed: () async {
//              await CoreHelpers.openLink(
//                  "${ConnectedApi.authorityType}://${ConnectedApi.endpoint}/TermsOfService.html");
            }),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
        IconButton(
      icon: Icon(Icons.info, color: widgetLightGreyColor),
      onPressed: (){},
    ),
  ],
),
        Center(
          child: LabelledCheckboxWidget(
            title: "Accept Terms and Conditions",
            controller: termsController,
            titleStyle: greyText,
          ),
        ),

        errorMessage != null
            ? Center(
            child: Text(
              errorMessage,
              style: errorStyleRed,
              textAlign: TextAlign.center,
            ))
            : Container(),
        state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
            width: 300,
            height: 50,
            child: Container(
              child: RaisedButton(
                  color: widgetLightGreyColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Register',
                    style: titleStyleWhite,
                  ),
                  onPressed: (){ Navigator.pushReplacementNamed(context, 'qualifications');}),
            )),
        UIHelper.verticalSpaceLarge(),
      ],
    );
  }
}

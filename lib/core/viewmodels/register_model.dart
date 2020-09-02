
import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/shared/core_helpers.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import 'base_model.dart';

class RegisterModel extends BaseModel {
//  final AuthenticationService _authenticationService =
//  locator<AuthenticationService>();

  String errorMessage;
  bool skipEnabled = false;
  bool loginEnabled = true;
 // Function(ClientUserDto) navigateToHome;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cellNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController =
  TextEditingController();
  final TextEditingController idNumberController =
  TextEditingController();
  final TextEditingController registrationNumberController =
  TextEditingController();
  final TextEditingController occupationController =
  TextEditingController();
  final TextEditingController termsController =
  TextEditingController(text: "false");

  void init() {
    errorMessage = "";
    firstNameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    verifyPasswordController.text = "";
    cellNumberController.text = "";
    idNumberController.text = "";
    registrationNumberController.text = "";
    occupationController.text = "";
  }

  void register() {
    setState(ViewState.Busy);
    errorMessage = null;

    String registerErrorMessage = CoreHelpers.validateRegistrationDetails(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        cellNumberController.text,
        passwordController.text,
        verifyPasswordController.text,
        termsController.text,
    registrationNumberController.text,
    occupationController.text,
    idNumberController.text);
    if (registerErrorMessage != null) {
      errorMessage = registerErrorMessage;
      setState(ViewState.Idle);
    }
//    else {
//      _authenticationService
//          .register(
//          emailController.text,
//          cellNumberController.text,
//          passwordController.text,
//          firstNameController.text,
//          lastNameController.text)
//          .then((createdUser) {
//        if (createdUser == null) {
//          errorMessage = "Something went wrong, please retry";
//        }
//        setState(ViewState.Idle);
//        navigateToHome(createdUser);
//      }).catchError((error) {
//        errorMessage = '${error.toString()}';
//        setState(ViewState.Idle);
//      });
//    }
  }
}

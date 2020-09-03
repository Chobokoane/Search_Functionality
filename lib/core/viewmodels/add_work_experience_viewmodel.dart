
import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/shared/core_helpers.dart';
import 'package:flutter/material.dart';
import 'base_model.dart';

class AddWorkExperienceViewModel extends BaseModel {
//  final AuthenticationService _authenticationService =
//  locator<AuthenticationService>();

  String errorMessage;
  bool skipEnabled = false;
  bool loginEnabled = true;
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController jobTileNameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  void init() {
    errorMessage = "";
    employeeNameController.text = "";
    jobTileNameController.text = "";
    durationController.text = "";
  }

  void register() {
    setState(ViewState.Busy);
    errorMessage = null;

    String registerErrorMessage = CoreHelpers.validateQualificationDetails(
        employeeNameController.text,
        jobTileNameController.text,
        durationController.text,
       );
    if (registerErrorMessage != null) {
      errorMessage = registerErrorMessage;
      setState(ViewState.Idle);
    }
  }
}

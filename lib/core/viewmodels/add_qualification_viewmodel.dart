
import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/shared/core_helpers.dart';
import 'package:flutter/material.dart';
import 'base_model.dart';

class AddQualificationViewModel extends BaseModel {
//  final AuthenticationService _authenticationService =
//  locator<AuthenticationService>();

  String errorMessage;
  bool skipEnabled = false;
  bool loginEnabled = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController institutionNameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  void init() {
    errorMessage = "";
    nameController.text = "";
    institutionNameController.text = "";
    yearController.text = "";
  }

  void register() {
    setState(ViewState.Busy);
    errorMessage = null;

    String registerErrorMessage = CoreHelpers.validateQualificationDetails(
        nameController.text,
        institutionNameController.text,
        yearController.text,
       );
    if (registerErrorMessage != null) {
      errorMessage = registerErrorMessage;
      setState(ViewState.Idle);
    }
  }
}

import 'dart:io';

import 'package:intl/date_symbol_data_local.dart';

class CoreHelpers {
  static const savedUserKey = 'savedUserKey';

  static void setupLanguage() {
    initializeDateFormatting('en', null);
    initializeDateFormatting('en_ZA,', null);
  }


  static String getDeviceType() {
    if (Platform.isIOS) {
      return "IOS";
    } else if (Platform.isAndroid) {
      return "ANDROID";
    } else {
      return "WEB";
    }
  }
  static String validateProfileDetails(
      String userName,
      String firstNameText,
      String lastNameText,
      String dobText,
      String nationalityText,
      String genderText,) {
    String errorMessage;

    if (firstNameText.isEmpty) {
      errorMessage = "Please Enter Your First Name";
    } else if (lastNameText.isEmpty) {
      errorMessage = "Please Enter Your Last Name";
    } else if (userName.isEmpty ) {
      errorMessage = "Please Enter A UserName";
    } else if (dobText.isEmpty) {
      errorMessage = "Please select your date of birth";
    } else if (nationalityText.isEmpty) {
      errorMessage = "Please select your nationality";
    } else if (genderText.isEmpty) {
      errorMessage = "Please select your gender";
    }

    return errorMessage;
  }
  static String validateRegistrationDetails(
      String firstNameText,
      String lastNameText,
      String emailText,
      String nationalityText,
      String genderText,
      String passwordText,
      String idNumber,
      String registrationNumber,
      String occupation,
      String verifyPasswordText) {
    String errorMessage;
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailText);

    if (firstNameText.isEmpty) {
      errorMessage = "Please Enter Your First Name";
    } else if (lastNameText.isEmpty) {
      errorMessage = "Please Enter Your Last Name";
    } else if (emailText.isEmpty || !emailValid) {
      errorMessage = "Please Enter A Valid Email Address";
    } else if (nationalityText.isEmpty) {
      errorMessage = "Please select your nationality";
    } else if (genderText.isEmpty) {
      errorMessage = "Please select your gender";
    } else if (passwordText.isEmpty) {
      errorMessage = "Please Enter Your Password";
    } else if (verifyPasswordText.isEmpty) {
      errorMessage = "Please Verify Your Password";
    } else if (passwordText != verifyPasswordText) {
      errorMessage = "Passwords do not match";
    }

    return errorMessage;
  }
  static String validateQualificationDetails(
      String nameText,
      String institutionNameText,
      String yearText,
      ) {
    String errorMessage;

    if (nameText.isEmpty) {
      errorMessage = "Please Enter Your Name";
    } else if (institutionNameText.isEmpty) {
      errorMessage = "Please Enter Your Institution Name";
    } else if (yearText.isEmpty) {
      errorMessage = "Please select your year";
    }

    return errorMessage;
  }

  static String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String str = value.replaceAll("+", "");
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(str)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }
}

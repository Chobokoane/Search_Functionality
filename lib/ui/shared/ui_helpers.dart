import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceXSmall = 5.0;
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 20.0;
  static const double _VerticalSpaceLarge = 60.0;
  static const double _VerticalSpaceXLarge = 120.0;
  static const double _VerticalSpaceMediumLarge = 40.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceLarge = 60.0;
  static const double _HorizontalSpaceXLarge = 120.0;

  /// Returns a vertical space with height set to [_VerticalSpaceXSmall]
  static Widget verticalSpaceXSmall() {
    return verticalSpace(_VerticalSpaceXSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_VerticalSpaceMedium);
  }
  static Widget verticalSpaceMediumLarge() {
    return verticalSpace(_VerticalSpaceMediumLarge);
  }
  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_VerticalSpaceLarge);
  }

  static Widget verticalSpaceXLarge() {
    return verticalSpace(_VerticalSpaceXLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  static void showDialogNoActions(
      BuildContext context, Text title, Widget content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  static void showDialogOneAction(BuildContext context, Text title,
      Widget content, Function onClickButton, String buttonText) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: <Widget>[
              FlatButton(
                child: Text(buttonText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClickButton();
                },
              )
            ],
          );
        });
  }

  static void showDialogTwoActions(
      BuildContext context,
      Text title,
      Widget content,
      Function onClickButtonOne,
      String buttonOneText,
      Function onClickButtonTwo,
      String buttonTwoText) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: <Widget>[
              FlatButton(
                child: Text(buttonOneText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClickButtonOne();
                },
              ),
              FlatButton(
                child: Text(buttonTwoText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClickButtonTwo();
                },
              ),
            ],
          );
        });
  }



  static bool isLargeScreen(double screenWidth) {
    return screenWidth > 900;
  }

  static bool isLargeAspectRatio(double aspectRatio) {
    return aspectRatio < 0.5;
  }
}

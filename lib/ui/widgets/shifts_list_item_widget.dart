import 'package:filter/core/model/branches_model.dart';
import 'package:filter/core/model/search_model.dart';
import 'package:filter/core/model/shifts_model.dart';

import 'package:filter/core/shared/core_helpers.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/round_image_widget.dart';
import 'package:flutter/material.dart';


class ShiftListItemWidget extends StatelessWidget {
  final ShiftsModel shifts;

  const ShiftListItemWidget({Key key, this.shifts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Row(
      children: [
        RoundImageWidget(
          marginTop: 0,
          height: CoreHelpers.getDeviceType() == "IOS" && UIHelper.isLargeAspectRatio(aspectRatio) ? 45: 40,
         // path: "assets/images/search_icons/${shifts.searchIcon}.jpg",
        ),
        UIHelper.horizontalSpaceSmall(),
        Expanded(
          child: Text(
            shifts.name,
            style: CoreHelpers.getDeviceType() == "IOS" && UIHelper.isLargeAspectRatio(aspectRatio) ? appSubHeaderStyle : textStyle,
          ),
        ),
      ],
    );
  }
}

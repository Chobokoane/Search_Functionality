import 'package:filter/core/model/company_model.dart';
import 'package:filter/core/model/location_model.dart';
import 'package:filter/core/shared/core_helpers.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/round_image_widget.dart';
import 'package:flutter/material.dart';


class LocationListItemWidget extends StatelessWidget {
  final LocationModel location;

  const LocationListItemWidget({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Row(
      children: [
        RoundImageWidget(
          marginTop: 0,
          height: CoreHelpers.getDeviceType() == "IOS" && UIHelper.isLargeAspectRatio(aspectRatio) ? 45: 40,
        ),
        UIHelper.horizontalSpaceSmall(),
        Expanded(
          child: Text(
            location.name,
            style: CoreHelpers.getDeviceType() == "IOS" && UIHelper.isLargeAspectRatio(aspectRatio) ? appSubHeaderStyle : textStyle,
          ),
        ),
      ],
    );
  }
}

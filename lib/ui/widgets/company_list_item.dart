import 'package:filter/core/model/search_model.dart';
import 'package:filter/core/shared/core_helpers.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/round_image_widget.dart';
import 'package:flutter/material.dart';


class CompanyListItem extends StatelessWidget {
  final CompanyModel company;

  const CompanyListItem({Key key, this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Row(
      children: [
        RoundImageWidget(
          marginTop: 0,
          height: CoreHelpers.getDeviceType() == "IOS" && UIHelper.isLargeAspectRatio(aspectRatio) ? 45: 40,
          path: "assets/images/search_icons/${company.searchIcon}.jpg",
        ),
        UIHelper.horizontalSpaceSmall(),
        Expanded(
          child: Text(
            company.name,
            style: CoreHelpers.getDeviceType() == "IOS" && UIHelper.isLargeAspectRatio(aspectRatio) ? appSubHeaderStyle : textStyle,
          ),
        ),
      ],
    );
  }
}

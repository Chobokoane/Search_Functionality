import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final double marginTop;
  final Color backgroundColor;
  final String path;
  final bool network;
  final double height;

  const RoundImage(
      {Key key,
      this.marginTop = 20.0,
      this.backgroundColor = Colors.transparent,
      this.path = '',
      this.network = false,
      this.height = 300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop),
      child: network
          ? FadeInImage.assetNetwork(
        placeholder: 'assets/images/image_placeholder.png',
        image: path,
        height: height,
        fit: BoxFit.scaleDown,
      )
          : Image.asset(
        path,
        height: height,
        fit: BoxFit.scaleDown,
      ),
    );;
  }
}

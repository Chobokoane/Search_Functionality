import 'package:flutter/material.dart';

class PaddedDividerWidget extends StatelessWidget {
  final Color color;
  final EdgeInsets padding;

  PaddedDividerWidget({this.color = const Color(0xffE3E3E3), this.padding = const EdgeInsets.all(15.0)});
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: padding,
      child: Divider(
        height:0.5,
      ),
    );
  }

}
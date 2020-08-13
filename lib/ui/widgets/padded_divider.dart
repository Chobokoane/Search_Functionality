import 'package:flutter/material.dart';

class PaddedDivider extends StatelessWidget {
  final Color color;
  final EdgeInsets padding;

  PaddedDivider({this.color = const Color(0xffE3E3E3), this.padding = const EdgeInsets.all(8.0)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        height: 1.5,
      ),
    );
  }

}
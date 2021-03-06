import 'package:filter/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlainTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double horizontalPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final bool showPrefixIcon;
  final bool boarder;
  final bool capitalizeWords;
  final Function(String) onTextChange;

  PlainTextField({this.controller, this.hint = "First Name", this.horizontalPadding = 15,
    this.verticalPadding = 0, this.horizontalMargin = 15, this.verticalMargin = 0,
    this.showPrefixIcon = false, this.boarder = false, this.capitalizeWords = true, this.onTextChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      width: 400,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: widgetBgColor,
          borderRadius: boarder ? BorderRadius.circular(30.0): null
      ),
      child: TextFormField(
        maxLines: 1,
        inputFormatters: [LengthLimitingTextInputFormatter(100)],
        keyboardType: TextInputType.text,
        textCapitalization: capitalizeWords ? TextCapitalization.words : TextCapitalization.sentences,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hint,
          labelText: hint,
          icon: showPrefixIcon ? Icon(
            Icons.text_fields,
            color: secondaryColor,
          ) : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          border: boarder ? InputBorder.none : UnderlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: boarder ? InputBorder.none : UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor)
          ),
        ),
        controller: controller,
        onChanged: onTextChange,
      ),
    );
  }
}
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class LabelledCheckboxWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final TextStyle titleStyle;
  final ListTileControlAffinity affinity;

  const LabelledCheckboxWidget({Key key, @required this.controller, @required this.title, this.titleStyle = textStyle, this.affinity = ListTileControlAffinity.leading, }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LabelledCheckboxWidgetState();

}

class _LabelledCheckboxWidgetState extends State<LabelledCheckboxWidget> {
  bool choiceEnabled;

  @override
  void initState() {
    choiceEnabled = widget.controller.text.isNotEmpty
        ? widget.controller.text == "true"
        : false;
    widget.controller.text = choiceEnabled.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (value) {
        widget.controller.text = value.toString();
        setState(() {
          choiceEnabled = value;
        });
      },
      value: choiceEnabled,
      title: Text(widget.title, style: widget.titleStyle,),
      controlAffinity: widget.affinity,
      activeColor: widgetLightGreyColor,
    );
  }
}




import 'package:filter/core/model/category_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class CategorySelectionWidget extends StatefulWidget {
  final String defaultValue;
  final List<Category> categoryList;
  final Function(String) onSelection;

  const CategorySelectionWidget({Key key, this.categoryList, this.onSelection, this.defaultValue = "All"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CategorySelectionWidgetState();
}

class CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  String currentValue;

  @override
  void initState() {
    currentValue = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryChoices = List();

    widget.categoryList.forEach((categories) {
      categoryChoices.add(Container(
        padding: EdgeInsets.all(5.0),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          label: Text(categories.name, style: currentValue == categories.name ? textStyleWhite : textStyle,),
          backgroundColor: widgetBgColor,
          selectedColor: primaryColor,

          selected: currentValue == categories.name,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                currentValue = categories.name;
                widget.onSelection(currentValue);
              }
            });
          },
        ),
      ));
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryChoices,
      ),
    );
  }
}
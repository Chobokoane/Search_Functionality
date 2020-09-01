import 'package:filter/core/model/category_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class CategorySelectionWidget extends StatefulWidget {
  final String defaultValue;
  final List<CategoryModel> categoryList;
  final Function(String) onSelection;

  const CategorySelectionWidget(
      {Key key,
      this.categoryList,
      this.onSelection,
      this.defaultValue = "Location"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CategorySelectionState();
}

class CategorySelectionState extends State<CategorySelectionWidget> {
  String currentValue;

  @override
  void initState() {
    currentValue = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryChoices = List();

    widget.categoryList.forEach((category) {
      categoryChoices.add(Container(
        padding: EdgeInsets.all(8.0),
        child: ChoiceChip(

          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          label: Container(
            //color: Colors.grey,

              width: 120,
              height: 30,
              child: Center(
                child: Text(
                  category.name,
                  style:
                      currentValue == category.name ? textStyleWhite : textStyles,
                ),
              )),

          backgroundColor: widgetBgColor,
          selectedColor: widgetLightGreyColor,
          selected: currentValue == category.name,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                currentValue = category.name;
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

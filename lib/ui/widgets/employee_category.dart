import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/employees_category.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class EmployeesCategoryWidget extends StatefulWidget {
  final String defaultValue;
  final List<EmployeesCategoryModel> employeesCategoryList;
  final Function(String) onSelection;

  const EmployeesCategoryWidget(
      {Key key,
        this.employeesCategoryList,
        this.onSelection,
        this.defaultValue = "Branches"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CategorySelectionState();
}

class CategorySelectionState extends State<EmployeesCategoryWidget> {
  String currentValue;

  @override
  void initState() {
    currentValue = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryChoices = List();

    widget.employeesCategoryList.forEach((employeesCategory) {
      categoryChoices.add(Container(
        padding: EdgeInsets.all(8.0),
        child: ChoiceChip(

          labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          label: Container(
            //color: Colors.grey,
              width: 125,
              height: 30,
              child: Center(
                child: Text(
                  employeesCategory.name,
                  style:
                  currentValue == employeesCategory.name ? textStyleWhite : textStyles,
                ),
              )),
          selectedColor: widgetLightGreyColor,
          selected: currentValue == employeesCategory.name,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                currentValue = employeesCategory.name;
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

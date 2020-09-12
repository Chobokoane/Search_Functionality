import 'package:filter/core/model/branches_model.dart';
import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/employees_category.dart';
import 'package:filter/core/model/shifts_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/widgets/category_selection_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'employee_category.dart';


class EmployeesFilterWidget extends StatefulWidget {
  final List<EmployeesCategoryModel> employeesCategoryList;
  final Function(String) onSelection;
  final Function(String) onTextChange;

  const EmployeesFilterWidget(
      {Key key, this.employeesCategoryList, this.onSelection, this.onTextChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchFilterWidgetState();
}

class SearchFilterWidgetState extends State<EmployeesFilterWidget> {

  Widget _categorySelection;

  @override
  void initState() {
    _categorySelection = EmployeesCategoryWidget(
        employeesCategoryList: widget.employeesCategoryList, onSelection: widget.onSelection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _categorySelection,
            ),
          ],
        ),

      ],
    );
  }

}

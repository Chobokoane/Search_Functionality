import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/viewmodels/employees_details_viewmodel.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/widgets/employee_filter.dart';
import 'package:filter/ui/widgets/padded_divider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class EmployeesDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    print("aspectRatio: $aspectRatio");
    return BaseView<EmployeesDetailsViewModel>(
      onModelReady: (model) {
        model.getEmployeesDetailsList();
        model.getEmployeesCategory();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: widgetBgColor,
        appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: widgetLightGreyColor,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: widgetGreyColor, //change your color here
          ),
          title: Text(
            "Employees Details",
            style: TextStyle(color: textColorWhite),
          ),
        ),
        body: Column(
          children: [
            PaddedDividerWidget(
              color: Colors.black45,
            ),
            model.state == ViewState.Busy
                ? Center(
              child: CircularProgressIndicator(),
            )
                : model.errorMessage != null
                ? Center(
              child: Text(model.errorMessage,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            )
                : Container(),
            Expanded(
              child: Column(
                children: [
                  model.employeesDetailsList.isNotEmpty
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.employeesDetailsList == null
                          ? 0
                          : model.filteredEmployeesDetailsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: widgetLightGreyColor,
                          child: new ListTile(
                            title: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    '${model.filteredEmployeesDetailsList[index].title} ',
                                    style: normalText,
                                  ),
                                ),
                                Text(
                                    '${model.filteredEmployeesDetailsList[index].description}'),
                                UIHelper.verticalSpaceMedium(),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,color: widgetGreyColor,),
                                    Text(
                                        '${model.filteredEmployeesDetailsList[index].street}'),
                                  ],
                                ),
                                Text(
                                    '      ${model.filteredEmployeesDetailsList[index].city}'),
                                Text('     ${model.filteredEmployeesDetailsList[index].code}'),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                      : Container(),
                  model.employeesCategoryList.isNotEmpty
                      ? EmployeesFilterWidget(
                    employeesCategoryList: model.employeesCategoryList,
                    onSelection: (selectedCategory) {
                      model.employeesFilter(selectedCategory);
                    },

                  )
                      : Container(),

                  model.selectedCategory == "Shifts"
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.shiftsList == null
                          ? 0
                          : model.filteredShiftsList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Column (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          ],
                        ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, 'employeesDetails');
                          },
                        );
                      },
                    ),
                  ):model.selectedCategory == "Branches"
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.shiftsList == null
                          ? 0
                          : model.filteredShiftsList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            color: widgetLightGreyColor,
                            child: new  ListTile(

                              title:  Column (
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                ],
                              ),

                            ),
                          ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, 'employeesDetails');
                          },
                        );
                      },
                    ),
                  ):model.selectedCategory == "Description"
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.shiftsList == null
                          ? 0
                          : model.filteredShiftsList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            color: widgetLightGreyColor,
                            child: new  ListTile(

                              title:  Column (
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                ],
                              ),

                            ),
                          ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, 'employeesDetails');
                          },
                        );
                      },
                    ),
                  ):Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/viewmodels/employees_details_viewmodel.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:filter/ui/views/branches_view.dart';
import 'package:filter/ui/widgets/padded_divider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class EmployeesDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
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
          elevation: 5,
          backgroundColor: widgetLightGreyColor1,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: widgetGreyColor, //change your color here
          ),
          title: Text(

            "Employees Details",
            style: TextStyle(color: widgetLightGreyColor),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios,color: widgetGreyColor,),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
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
                                color: widgetLightGreyColor1,
                                child: new ListTile(
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          '${model.filteredEmployeesDetailsList[index].title} ',
                                          style: normalText,
                                        ),
                                      ),
                                      UIHelper.verticalSpaceSmall(),
                                      Text(
                                        '    ______________________________________________'
                                      ),
                                      UIHelper.verticalSpaceSmall(),
                                      Text(
                                          '${model.filteredEmployeesDetailsList[index].description}',style: greyText,),
                                      UIHelper.verticalSpaceMedium(),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: widgetGreyColor,
                                          ),
                                          Text(
                                              '${model.filteredEmployeesDetailsList[index].street}',style: greyText,),
                                        ],
                                      ),
                                      Text(
                                          '      ${model.filteredEmployeesDetailsList[index].city}',style: greyText,),
                                      Text(
                                          '      ${model.filteredEmployeesDetailsList[index].code}',style: greyText,),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: NestedScrollView(
                  controller: scrollController,
                  physics: ScrollPhysics(),
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Row(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: FlatButton(
                                      //  color: buttonColor1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Shifts",
                                        style: TextStyle(
                                            color: textColorDarkBlue,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {}),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: FlatButton(
                                      //  color: buttonColor1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Branches",
                                        style: TextStyle(
                                            color: textColorDarkBlue,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {
                                        Expanded(
                                            child: ListView.builder(
                                              padding: EdgeInsets.symmetric(vertical: 0),
                                              itemCount: model.employeesDetailsList == null
                                                  ? 0
                                                  : model.filteredEmployeesDetailsList.length,

                                              itemBuilder: (BuildContext context, int index) {
                                                return InkWell(
                                                  child: Card(
                                                    color: secondaryColorLight,
                                                    child: new  ListTile(

                                                      title:  Column (
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [

                                                          Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Icon(Icons.location_on,color: widgetGreyColor,size: 20,),


                                                               Text("${model.filteredEmployeesDetailsList[index].street}\n\n"
                                                                   "${model.filteredEmployeesDetailsList[index].city}, ${model.filteredEmployeesDetailsList[index].code}",style: textStyle,),

                                                                Text("",style: textStyle,),
                                                                Container(
                                                                  height: 20,
                                                                  width: 20,
                                                                  child: FlatButton(

                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                    ),
                                                                    color: Colors.grey,
                                                                    child: Text("Read More",style: textStyleWhite,),
                                                                    onPressed: (){
                                                                      Navigator.pushReplacementNamed(context, 'register');
                                                                    },
                                                                  ),
                                                                ),
                                                              ]
                                                          )
                                                        ],
                                                      ),

                                                    ),
                                                  ),
                                                );
                                              },
                                            ));
                                      }),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: FlatButton(
                                      //  color: buttonColor1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Description",
                                        style: TextStyle(
                                            color: textColorDarkBlue,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {}),
                                ),
                              ),
                              UIHelper.verticalSpaceMedium(),
                            ],
                          )
                        ]),
                      ),
                    ];
                  },
                  body: Container()),
            ),
          ],
        ),
      ),
    );
  }
}

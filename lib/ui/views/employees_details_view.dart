import 'package:filter/core/viewmodels/employees_details_viewmodel.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class EmployeesDetailsView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    TabController _tabController;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    print("aspectRatio: $aspectRatio");
    return BaseView<EmployeesDetailsViewModel>(
        onModelReady: (model) {
          model.getEmployeesDetailsList();
          model.getEmployeesCategory();
        },
        builder: (context, model, child) => DefaultTabController(
            length: 3,
            child: Scaffold(
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
                    icon: new Icon(
                      Icons.arrow_back_ios,
                      color: widgetGreyColor,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ),
                body: Column(children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        model.employeesDetailsList.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  itemCount: model.employeesDetailsList == null
                                      ? 0
                                      : model
                                          .filteredEmployeesDetailsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      color: widgetLightGreyColor1,
                                      child: new ListTile(
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                '    ______________________________________________'),
                                            UIHelper.verticalSpaceSmall(),
                                            Text(
                                              '${model.filteredEmployeesDetailsList[index].description}',
                                              style: greyText,
                                            ),
                                            UIHelper.verticalSpaceMedium(),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: widgetGreyColor,
                                                ),
                                                Text(
                                                  '${model.filteredEmployeesDetailsList[index].street}',
                                                  style: greyText,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '      ${model.filteredEmployeesDetailsList[index].city}',
                                              style: greyText,
                                            ),
                                            Text(
                                              '      ${model.filteredEmployeesDetailsList[index].code}',
                                              style: greyText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ): Container(),
                      ],
                    ),
                  ),

                  // the tab bar with two items
                    Padding(
                      padding: const EdgeInsets.only(bottom: 250),
                      child: Expanded(
                        child: TabBar(
                            isScrollable: true,
                            controller: _tabController,
                            indicatorColor: secondaryColor,
                            indicatorWeight: 5,
                            labelColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Tab(
                                  text: "Shifts",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Tab(
                                  text: "Branches",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Tab(
                                  text: "Description",
                                ),
                              ),
                            ]
                  ),
                      ),
                    ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(

                            color: Colors.white,
                         ),
                        Container(
                         height: 50,
                          color: Colors.white,
                            child:Expanded(
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
                                )
                            )
                        ),
                        Container(
                          height: 80,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              'Work experience goes here',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}

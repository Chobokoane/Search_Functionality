import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/viewmodels/home_model.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/widgets/branches_list_item_widget.dart';
import 'package:filter/ui/widgets/location_list_item_widget.dart';
import 'package:filter/ui/widgets/padded_divider_widget.dart';
import 'package:filter/ui/widgets/search_filter_widget.dart';
import 'package:filter/ui/widgets/search_list_item_widget.dart';
import 'package:filter/ui/widgets/shifts_list_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    print("aspectRatio: $aspectRatio");
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getCategories();
        model.getCompanyList();
      },
      builder: (context, model, child) => Scaffold(
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
                  model.categoryList.isNotEmpty
                      ? SearchFilterWidget(
                          categoryList: model.categoryList,
                          onSelection: (selectedCategory) {
                            model.companyFilter(selectedCategory);
                          },
                          onTextChange: (searchTerm) {
                            print("Search Term: $searchTerm");
                            model.companySearch(searchTerm);
                          },
                        )
                      : Container(),

                  model.selectedCategory == "Company"
                      ? Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            itemCount: model.companyList == null
                                ? 0
                                : model.filteredCompanyList.length,

                            itemBuilder: (BuildContext context, int index) {
                             return new  ListTile(

                                title:  Column (

                                  children: [
                                    Text("${model.filteredCompanyList[index].name} - ${model.filteredCompanyList[index].branchName} ${model.filteredCompanyList[index].description}",style: textStyle,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.location_on,color: Colors.grey,),
                                          Text("${model.filteredCompanyList[index].location}",style: textStyle,),
                                          Text("Shift: ${model.filteredCompanyList[index].shiftNumber}",style: textStyle,),
                                         FlatButton(
                                             shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12.0),
                                          ),
                                           color: Colors.grey,
                                              child: Text("Read More",style: textStyleWhite,),
                                              onPressed: (){},
                                            ),


                                        ]
                                    )
                                  ],
                                ),

                              );
                            },
                          ),
                        )
                      : model.selectedCategory == "Shifts"
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.shiftsList == null
                          ? 0
                          : model.filteredShiftsList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return new  ListTile(

                          title:  Column (

                            children: [
                              Text("${model.filteredShiftsList[index].name} - ${model.filteredShiftsList[index].branchName} ${model.filteredShiftsList[index].description}",style: textStyle,),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.location_on,color: Colors.grey,),
                                    Text("${model.filteredShiftsList[index].location}",style: textStyle,),
                                    Text("Shift: ${model.filteredShiftsList[index].shiftNumber}",style: textStyle,),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      color: Colors.grey,
                                      child: Text("Read More",style: textStyleWhite,),
                                      onPressed: (){},
                                    ),


                                  ]
                              )
                            ],
                          ),

                        );
                      },
                    ),
                  )
                          : model.selectedCategory == "Branches"
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.branchesList == null
                          ? 0
                          : model.filteredBranchesList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return new  ListTile(

                          title:  Column (

                            children: [
                              Text("${model.filteredBranchesList[index].name} - ${model.filteredBranchesList[index].branchName} ${model.filteredBranchesList[index].description}",style: textStyle,),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.location_on,color: Colors.grey,),
                                    Text("${model.filteredBranchesList[index].location}",style: textStyle,),
                                    Text("Shift: ${model.filteredBranchesList[index].shiftNumber}",style: textStyle,),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      color: Colors.grey,
                                      child: Text("Read More",style: textStyleWhite,),
                                      onPressed: (){},
                                    ),


                                  ]
                              )
                            ],
                          ),

                        );
                      },
                    ),
                  )
                              :  model.selectedCategory == "Location"
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.locationList == null
                          ? 0
                          : model.filteredLocationList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return new  ListTile(

                          title:  Column (

                            children: [
                              Text("${model.filteredLocationList[index].name} - ${model.filteredLocationList[index].branchName} ${model.filteredLocationList[index].description}",style: textStyle,),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.location_on,color: Colors.grey,),
                                    Text("${model.filteredLocationList[index].location}",style: textStyle,),
                                    Text("Shift: ${model.filteredLocationList[index].shiftNumber}",style: textStyle,),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      color: Colors.grey,
                                      child: Text("Read More",style: textStyleWhite,),
                                      onPressed: (){},
                                    ),


                                  ]
                              )
                            ],
                          ),

                        );
                      },
                    ),
                  )://                  model.branchesList.isNotEmpty
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.companyList == null
                          ? 0
                          : model.filteredCompanyList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return new  ListTile(

                          title:  Column (

                            children: [
                              Text("${model.filteredCompanyList[index].name} - ${model.filteredCompanyList[index].branchName} ${model.filteredCompanyList[index].description}",style: textStyle,),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.location_on,color: Colors.grey,),
                                    Text("${model.filteredCompanyList[index].location}",style: textStyle,),
                                    Text("Shift: ${model.filteredCompanyList[index].shiftNumber}",style: textStyle,),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      color: Colors.grey,
                                      child: Text("Read More",style: textStyleWhite,),
                                      onPressed: (){},
                                    ),


                                  ]
                              )
                            ],
                          ),

                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

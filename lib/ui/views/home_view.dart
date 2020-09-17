import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/viewmodels/home_viewmodel.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/widgets/padded_divider_widget.dart';
import 'package:filter/ui/widgets/search_filter_widget.dart';
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
                             return InkWell(
                               child: Card(
                                 color: widgetLightGreyColor1,
                                 child: new  ListTile(

                                    title:  Column (
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                    RichText(
                                    text: TextSpan(
                                    text: '${model.filteredCompanyList[index].name} - ',
                                      style: TextStyle(fontSize: 18,color:textColorGrey),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${model.filteredCompanyList[index].branchName}',
                                          style: TextStyle(fontSize: 18,color:textColorGrey ),
                                        ),
                                        TextSpan(text: ' ${model.filteredCompanyList[index].description}',style: textStyle),
                                      ],
                                    ),
                                 ),
                                       // Text("${model.filteredCompanyList[index].name} - ${model.filteredCompanyList[index].branchName} ${model.filteredCompanyList[index].description}",style: textStyle,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.location_on,color: widgetGreyColor,),

                                              Padding(
                                                padding: const EdgeInsets.only(left:8),
                                                child: Text("${model.filteredCompanyList[index].location}",style: textStyle,),
                                              ),
                                              Text("Shift: ${model.filteredCompanyList[index].shiftNumber}",style: textStyle,),
                                             FlatButton(
                                                 shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12.0),
                                              ),
                                               color: Colors.grey,
                                                  child: Text("Read More",style: textStyleWhite,),
                                                  onPressed: (){
                                                    Navigator.pushReplacementNamed(context, 'register');
                                                  },
                                                ),
                                            ]
                                        )
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
                        )
                      : model.selectedCategory == "Location"
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.locationList == null
                          ? 0
                          : model.filteredLocationList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: widgetLightGreyColor1,

                          child: new  ListTile(

                            title:  Column (
                             mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(),
                                Text("${model.filteredLocationList[index].location} ",style: styleBlack,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      color: widgetBgColor,
                                      child: Text("Subscribe",style: greyText,),
                                      onPressed: (){},
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ),
                        );
                      },
                    ),
                  ): Container(  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

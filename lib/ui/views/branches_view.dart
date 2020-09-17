import 'package:filter/core/viewmodels/home_viewmodel.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class BranchesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    print("aspectRatio: $aspectRatio");
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getCategories();
        model.getCompanyList();
      },
      builder: (context, model, child) => Column(
          children: [

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.companyList == null
                          ? 0
                          : model.filteredCompanyList.length,

                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            color: widgetLightGreyColor,
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
                                ],
                              ),

                            ),
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
      );
  }
}

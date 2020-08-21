import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/viewmodels/home_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/widgets/branches_list_item_widget.dart';
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
            Expanded(
              child: Column(
                children: [

              model.selectedCategory == "Company" ?
               Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.companyList == null
                          ? 0 : model.filteredCompanyList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new ListTile(
                            title: SearchListItemWidget(company: model.filteredCompanyList[index],),

                        );

                      },
//                      separatorBuilder: (context, index) => PaddedDividerWidget(
//                        color: Colors.black45,
//                        padding: EdgeInsets.symmetric(
//                            vertical: 0, horizontal: 12),
//                      ),
                    ),
                  )
                      : model.selectedCategory == "Branches" ?  Container()
                  : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: model.shiftsList == null
                          ? 0 : model.filteredShiftsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new ListTile(
                          title: ShiftListItemWidget(shifts: model.filteredShiftsList[index],),

                        );
                      },
//                      separatorBuilder: (context, index) => PaddedDividerWidget(
//                        color: Colors.black45,
//                        padding: EdgeInsets.symmetric(
//                            vertical: 0, horizontal: 12),
//                      ),
                    ),
                  ),

//                  model.branchesList.isNotEmpty
//                      ? Expanded(
//                    child: ListView.separated(
//                      padding: EdgeInsets.symmetric(vertical: 0),
//                      itemCount: model.branchesList == null
//                          ? 0 : model.filteredBranchesList.length,
//                      itemBuilder: (BuildContext context, int index) {
//                        return new ListTile(
//                          title: BranchesListItemWidget(branches: model.filteredBranchesList[index],),
//
//                        );
//                      },
//                      separatorBuilder: (context, index) => PaddedDividerWidget(
//                        color: Colors.black45,
//                        padding: EdgeInsets.symmetric(
//                            vertical: 0, horizontal: 12),
//                      ),
//                    ),
//                  )
//                      : Container()
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}
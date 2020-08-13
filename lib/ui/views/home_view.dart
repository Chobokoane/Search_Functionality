
import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/viewmodels/home_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/views/base_view.dart';
import 'package:filter/ui/widgets/padded_divider.dart';
import 'package:filter/ui/widgets/search_filter_widget.dart';
import 'package:filter/ui/widgets/store_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    print("aspectRatio: $aspectRatio");
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getAllStores();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: widgetBgColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(top: 10),
            child: AppBar(
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: primaryColor, //change your color here
              ),
              backgroundColor: widgetBgColor,
              elevation: 0,
              title: Text(
                "Search",
                style: appHeaderStyle,
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Column(
          children: [
            PaddedDivider(
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
            SearchFilterWidget(
              categoryList: model.categoryList,
              onSelection: (selectedCategory) {
                model.filterStores(selectedCategory);
              },
              onTextChange: (searchTerm) {
                print("Search Term: $searchTerm");
                model.searchStores(searchTerm);
              },
            ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                decoration: myBoxDecoration(), //             <--- BoxDecoration here
                child: FlatButton(

                  child: Text('Employees'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'employeesView');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: myBoxDecoration(),
                child: FlatButton(
                  child: Text('Company'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'companyView');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: myBoxDecoration(),
                child: FlatButton(
                  child: Text('Shifts'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'shiftsView');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: myBoxDecoration(),
                child: FlatButton(
                  child: Text('Branches'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'branchesView');
                  },
                ),
              ),
              ///add more as you wish
            ],
          ),
        ),
            Expanded(
              child: Column(
                children: [
                  model.searchList.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            itemCount: model.searchList == null
                                ? 0
                                : model.filteredStoreList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return new ListTile(
                                  title: StoreListItem(
                                    store: model.filteredStoreList[index],
                                  ),
                                  onTap: () {
                                    print(model.filteredStoreList[index].name);
                                    Navigator.pushNamed(context, "add_card",
                                        arguments:
                                            model.filteredStoreList[index]);
                                  });
                            },
                            separatorBuilder: (context, index) => PaddedDivider(
                              color: Colors.black45,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }
}



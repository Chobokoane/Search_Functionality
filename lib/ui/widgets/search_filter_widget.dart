import 'package:filter/core/model/branches_model.dart';
import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/shifts_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/widgets/category_selection_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchFilterWidget extends StatefulWidget {
  final List<CategoryModel> categoryList;
  final Function(String) onSelection;
  final Function(String) onTextChange;

  const SearchFilterWidget(
      {Key key, this.categoryList, this.onSelection, this.onTextChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchFilterWidgetState();
}

class SearchFilterWidgetState extends State<SearchFilterWidget> {
  final TextEditingController _filter = new TextEditingController();
  Icon _searchIcon = new Icon(Icons.search, color: primaryColor);
  String _searchText = "";
  Widget _categorySelection;

  SearchFilterWidgetState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text.isEmpty ? "" : _filter.text;
      });
      widget.onTextChange(_searchText);
    });
  }

  @override
  void initState() {
    _categorySelection = CategorySelectionWidget(
        categoryList: widget.categoryList, onSelection: widget.onSelection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        height: 60.0,
        decoration: new BoxDecoration(
            color: Colors.grey[400],
            borderRadius: new BorderRadius.circular(50.0)
        ),
        child: new TextField(
          controller: _filter,

          decoration: InputDecoration(

              hintText: "Search Here",
              suffixIcon: Icon(Icons.search,color: Colors.white,size: 20,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)))),
        ),
      ),
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

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        widget.onTextChange("");
        this._searchIcon = new Icon(Icons.close);
        this._categorySelection = new TextField(
          controller: _filter,
          decoration: new InputDecoration(

              suffixIcon: new Icon(Icons.search), hintText: 'Search...', border: OutlineInputBorder(),),
        );
      } else {
        this._searchIcon = new Icon(Icons.search, color: primaryColor);
        this._categorySelection = CategorySelectionWidget(
            categoryList: widget.categoryList, onSelection: widget.onSelection);
        _filter.clear();
        widget.onTextChange("");
      }
    });
  }
}

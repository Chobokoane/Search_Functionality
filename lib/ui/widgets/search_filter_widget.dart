import 'package:filter/core/model/category.dart';
import 'package:filter/core/model/employees_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/widgets/CategorySelection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchFilterWidget extends StatefulWidget {
  final List<Category> categoryList;
  final List<Employees> employeesList;
  final Function(String) onSelection;
  final Function(String) onTextChange;

  const SearchFilterWidget(
      {Key key, this.categoryList, this.onSelection, this.onTextChange, this.employeesList})
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
    _categorySelection = CategorySelection(
        categoryList: widget.categoryList, onSelection: widget.onSelection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBar(context);
  }

  Widget _buildBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: _searchIcon,
          //iconSize: 35,
          onPressed: _searchPressed,
        ),
        Expanded(
          child: _categorySelection,
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
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search, color: primaryColor);
        this._categorySelection = CategorySelection(
            categoryList: widget.categoryList, onSelection: widget.onSelection);
        _filter.clear();
        widget.onTextChange("");
      }
    });
  }
}

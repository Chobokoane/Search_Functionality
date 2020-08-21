import 'package:filter/core/model/category_model.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/widgets/category_selection_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return    Container(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
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
                Navigator.pushReplacementNamed(context, 'homeView');
              },
            ),
          ),
          ///add more as you wish
        ],
      ),
    );
  }
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }
}


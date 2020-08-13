import 'package:flutter/material.dart';
class CompanyContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return     Container(
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
    );
  }
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }
}
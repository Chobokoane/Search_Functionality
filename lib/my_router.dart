import 'package:filter/ui/views/branches_view.dart';
import 'package:filter/ui/views/company_view.dart';
import 'package:filter/ui/views/home_view.dart';
import 'package:filter/ui/views/shifts_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) =>HomeView());

      case "companyView":
        return MaterialPageRoute(builder: (_) => CompanyView());
      case "shiftsView":
        return MaterialPageRoute(builder: (_) => ShiftView());
      case "branchesView":
        return MaterialPageRoute(builder: (_) => BranchesView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
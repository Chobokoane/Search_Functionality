import 'package:filter/ui/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class My_Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) =>HomeView());
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
import 'package:filter/ui/views/add_qualification_view.dart';
import 'package:filter/ui/views/add_work_experience_view.dart';
import 'package:filter/ui/views/employees_details_view.dart';
import 'package:filter/ui/views/home_view.dart';
import 'package:filter/ui/views/qualifications_view.dart';
import 'package:filter/ui/views/register_view.dart';
import 'package:filter/ui/views/work_experiance_viewl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class My_Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) =>HomeView());
      case "register":
        return MaterialPageRoute(builder: (_) =>RegisterView());
      case "qualifications":
        return MaterialPageRoute(builder: (_) =>QualificationsView());
      case "addQualifications":
        return MaterialPageRoute(builder: (_) =>AddQualificationView());
      case "workExperience":
        return MaterialPageRoute(builder: (_) =>WorkExperienceView());
      case "addWorkExperience":
        return MaterialPageRoute(builder: (_) =>AddWorkExperienceView());
      case "document":
        return MaterialPageRoute(builder: (_) =>AddWorkExperienceView());
      case "employeesDetails":
        return MaterialPageRoute(builder: (_) =>EmployeesDetailsView());
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
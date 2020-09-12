import 'package:filter/core/viewmodels/base_model.dart';

class EmployeesDetailsModel {
  String title;
  String description;
  String street;
  String city;
  String code;


  EmployeesDetailsModel(this.title,this.description,this.city,this.code,this.street);

  EmployeesDetailsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    city = json['city'];
    code = json['code'];
    street = json['street'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.city != null) {
      data['city'] = this.city;
    }
    if (this.code != null) {
      data['code'] = this.code;
    }
    if (this.street != null) {
      data['street'] = this.street;
    }
    return data;
  }
}
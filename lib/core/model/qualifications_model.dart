import 'package:filter/core/viewmodels/base_model.dart';

class QualificationsModel extends BaseModel{
  String title;
  String university;
  String year;

  QualificationsModel(this.title,this.university,this.year);

  QualificationsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    university = json['university'];
    year = json['year'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.university != null) {
      data['university'] = this.university;
    }
    if (this.year != null) {
      data['year'] = this.year;
    }
    return data;
  }
}
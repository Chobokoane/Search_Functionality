import 'package:filter/core/viewmodels/base_model.dart';

class WorkExperienceModel extends BaseModel{
  String company;
  String position;
  String duration;

  WorkExperienceModel(this.company,this.position,this.duration);

  WorkExperienceModel.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    position = json['position'];
    duration = json['duration'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company;
    }
    if (this.position != null) {
      data['position'] = this.position;
    }
    if (this.duration != null) {
      data['duration'] = this.duration;
    }
    return data;
  }
}
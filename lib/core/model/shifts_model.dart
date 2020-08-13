class Shifts {
  String name;
  DateTime time;


  Shifts(this.name,this.time);

  Shifts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.time != null) {
      data['id'] = this.time;
    }


    return data;
  }
}
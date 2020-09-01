class LocationModel {
  String id;
  String category;
  String location;
String name;

  LocationModel(this.id, this.category,cards, created,this.location,this.name);

  LocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    location = json['location'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['location'] = this.location;
    data['name'] = this.name;

    return data;
  }
}
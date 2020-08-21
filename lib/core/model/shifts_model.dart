class ShiftsModel {
  String name;
  DateTime time;
  String category;
  String searchIcon;

  ShiftsModel(this.name,this.time,this.category,this.searchIcon);

  ShiftsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['id'];
    category = json['category'];
    searchIcon = json['searchIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.time != null) {
      data['id'] = this.time;
    }
    if (this.category != null) {
      data['category'] = this.category;
    }
    if (this.searchIcon != null) {
      data['searchIcon'] = this.searchIcon;
    }


    return data;
  }
}
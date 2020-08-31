class ShiftsModel {
  String name;
  DateTime time;
  String category;
  String searchIcon;
  String branchName;
  String description;
  String location;
  String shiftNumber;

  ShiftsModel(this.name,this.time,this.category,this.searchIcon,this.description,this.branchName,this.location,this.shiftNumber);

  ShiftsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['id'];
    category = json['category'];
    searchIcon = json['searchIcon'];
    description = json['description'];
    branchName = json['branchName'];
    location = json['location'];
    shiftNumber = json['shiftNumber'];

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
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.branchName != null) {
      data['branchName'] = this.branchName;
    }
    if (this.location != null) {
      data['location'] = this.location;
    }
    if (this.shiftNumber != null) {
      data['shiftNumber'] = this.shiftNumber;
    }

    return data;
  }
}
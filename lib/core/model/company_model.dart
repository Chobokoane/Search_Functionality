class CompanyModel {
  String id;
  String name;
  String category;
  String searchIcon;
  String branchName;
  String description;
  String location;
  String shiftNumber;

  CompanyModel(this.id, this.name, this.searchIcon, this.category,cards, created,this.description,this.branchName,this.location,this.shiftNumber);

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    searchIcon = json['searchIcon'];
    category = json['category'];
    description = json['description'];
    branchName = json['branchName'];
    location = json['location'];
    shiftNumber = json['shiftNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['searchIcon'] = this.searchIcon;
    data['category'] = this.category;
    data['description'] = this.description;
    data['branchName'] = this.branchName;
    data['location'] = this.location;
    data['shiftNumber'] = this.shiftNumber;

    return data;
  }
}
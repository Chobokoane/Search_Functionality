class CompanyModel {
  String id;
  String name;
  String searchIcon;
  String category;

  CompanyModel(this.id, this.name, this.searchIcon, this.category,cards, created);

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    searchIcon = json['searchIcon'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['searchIcon'] = this.searchIcon;
    data['category'] = this.category;

    return data;
  }
}
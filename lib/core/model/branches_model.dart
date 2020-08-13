class Branches {
  String name;
  int id;
  String searchIcon;
  String category;


  Branches(this.name,this.id,this.searchIcon,this.category);

  Branches.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    searchIcon = json['searchIcon'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.searchIcon != null) {
      data['searchIcon'] = this.searchIcon;
    }
    if (this.category != null) {
      data['category'] = this.category;
    }


    return data;
  }
}
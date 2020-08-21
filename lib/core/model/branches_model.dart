class BranchesModel {
  String name;
  int id;
  String category;


  BranchesModel(this.name,this.id,this.category);

  BranchesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
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
    if (this.category != null) {
      data['category'] = this.category;
    }



    return data;
  }
}
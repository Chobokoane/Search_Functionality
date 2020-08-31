class BranchesModel {
  String name;
  int id;
  String category;
  String branchName;
  String description;
  String location;
  String shiftNumber;


  BranchesModel(this.name,this.id,this.category,this.description,this.branchName,this.location,this.shiftNumber);

  BranchesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    category = json['category'];
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
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.category != null) {
      data['category'] = this.category;
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
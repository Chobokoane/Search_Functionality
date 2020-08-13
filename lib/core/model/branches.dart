class Branches {
  String name;
  int id;


  Branches(this.name,this.id);

  Branches.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.id != null) {
      data['id'] = this.id;
    }


    return data;
  }
}
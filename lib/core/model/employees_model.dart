class Employees {
  String name;
  int number;
  String position;
  String cardType;
  String barCode;


  Employees(this.name,this.number,this.position,this.barCode,this.cardType);

  Employees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    position = json['position'];
    barCode = json['barCode'];
    cardType = json['cardType'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.number != null) {
      data['number'] = this.number;
    }
    if (this.position != null) {
      data['position'] = this.position;
    }
    if (this.barCode != null) {
      data['barCode'] = this.barCode;
    }
    if (this.cardType != null) {
      data['cardType'] = this.cardType;
    }


    return data;
  }
}
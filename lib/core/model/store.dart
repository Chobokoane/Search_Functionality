import 'package:filter/core/shared/date_formats.dart';


class Search {
  String id;
  String name;
  String searchIcon;
  String category;
  DateTime created;

  Search(this.id, this.name, this.searchIcon, this.category,cards, created) {
    this.created = created != null ? responseDateFormat.parse(created) : null;
  }

  Search.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    searchIcon = json['searchIcon'];
    category = json['category'];
    created = json.containsKey('created') && json['created'] != null ? responseDateFormat.parse(json['created']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['searchIcon'] = this.searchIcon;
    data['category'] = this.category;
    if (this.created != null) {
      data['created'] = this.created.toIso8601String();
    }
    return data;
  }
}
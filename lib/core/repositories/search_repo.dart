import 'dart:convert';

import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/search_model.dart';
import 'package:flutter/services.dart' show rootBundle;


class SearchRepo {
  Future<String> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath);
  }

  Future<List<Category>>  getCategory() async {
    String categoryJson = await parseJsonFromAssets("assets/json/category.json");
    print("This are the results ${json.decode(categoryJson)}");
    return (json.decode(categoryJson) as List).map((data) => Category.fromJson(data)).toList();
  }

  Future<List<Search>>  getStoreList() async {
    String categoryJson = await parseJsonFromAssets("assets/json/all.json");
    return (json.decode(categoryJson) as List).map((data) => Search.fromJson(data)).toList();
  }
  Future<List<Search>>  getEmployeesList() async {
    String categoryJson = await parseJsonFromAssets("assets/json/employees.json");
    return (json.decode(categoryJson) as List).map((data) => Search.fromJson(data)).toList();
  }
  Future<List<Search>>  getBranchesList() async {
    String categoryJson = await parseJsonFromAssets("assets/json/branches.json");
    return (json.decode(categoryJson) as List).map((data) => Search.fromJson(data)).toList();
  }
  Future<List<Search>>  getShiftsList() async {
    String categoryJson = await parseJsonFromAssets("assets/json/shifts.json");
    return (json.decode(categoryJson) as List).map((data) => Search.fromJson(data)).toList();
  }
  Future<List<Search>>  getCompanyList() async {
    String categoryJson = await parseJsonFromAssets("assets/json/company.json");
    return (json.decode(categoryJson) as List).map((data) => Search.fromJson(data)).toList();
  }
}
import 'dart:convert';

import 'package:filter/core/model/branches_model.dart';
import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/search_model.dart';
import 'package:filter/core/model/shifts_model.dart';
import 'package:flutter/services.dart' show rootBundle;


class SearchRepo {
  Future<String> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath);
  }

  Future<List<CategoryModel>>  getCategory() async {
    String categoryJson = await parseJsonFromAssets("assets/json/category.json");
    print("This are the results ${json.decode(categoryJson)}");
    return (json.decode(categoryJson) as List).map((data) => CategoryModel.fromJson(data)).toList();
  }

  Future<List<CompanyModel>>  getStoreList() async {
    String searchJson = await parseJsonFromAssets("assets/json/all.json");
    return (json.decode(searchJson) as List).map((data) => CompanyModel.fromJson(data)).toList();
  }
  Future<List<CategoryModel>>  getCategoryList() async {
    String categoryJson = await parseJsonFromAssets("assets/json/category.json");
    return (json.decode(categoryJson) as List).map((data) => CategoryModel.fromJson(data)).toList();
  }
  Future<List<BranchesModel>>  getBranchesList() async {
    String categoryJson = await parseJsonFromAssets("assets/json/branches.json");
    return (json.decode(categoryJson) as List).map((data) => BranchesModel.fromJson(data)).toList();
  }
  Future<List<ShiftsModel>>  getShiftsList() async {
    String shiftsJson = await parseJsonFromAssets("assets/json/shifts.json");
    return (json.decode(shiftsJson) as List).map((data) => ShiftsModel.fromJson(data)).toList();
  }
  Future<List<CompanyModel>>  getCompanyList() async {
    String companyJson = await parseJsonFromAssets("assets/json/company.json");
    return (json.decode(companyJson) as List).map((data) => CompanyModel.fromJson(data)).toList();
  }
}
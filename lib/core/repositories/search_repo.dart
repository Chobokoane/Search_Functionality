import 'dart:convert';

import 'package:filter/core/model/branches_model.dart';
import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/company_model.dart';
import 'package:filter/core/model/employees_category.dart';
import 'package:filter/core/model/employees_details_model.dart';
import 'package:filter/core/model/location_model.dart';
import 'package:filter/core/model/qualifications_model.dart';
import 'package:filter/core/model/shifts_model.dart';
import 'package:filter/core/model/work_experience_model.dart';
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
  Future<List<EmployeesCategoryModel>>  getEmployeesCategoryList() async {
    String employeesCategoryJson = await parseJsonFromAssets("assets/json/employeescategory.json");
    return (json.decode(employeesCategoryJson) as List).map((data) => EmployeesCategoryModel.fromJson(data)).toList();
  }
  Future<List<BranchesModel>>  getBranchesList() async {
    String branchesJson = await parseJsonFromAssets("assets/json/branches.json");
    return (json.decode(branchesJson) as List).map((data) => BranchesModel.fromJson(data)).toList();
  }
  Future<List<ShiftsModel>>  getShiftsList() async {
    String shiftsJson = await parseJsonFromAssets("assets/json/shifts.json");
    return (json.decode(shiftsJson) as List).map((data) => ShiftsModel.fromJson(data)).toList();
  }
  Future<List<CompanyModel>>  getCompanyList() async {
    String companyJson = await parseJsonFromAssets("assets/json/company.json");
    return (json.decode(companyJson) as List).map((data) => CompanyModel.fromJson(data)).toList();
  }
  Future<List<LocationModel>>  getLocationList() async {
    String locationJson = await parseJsonFromAssets("assets/json/location.json");
    return (json.decode(locationJson) as List).map((data) => LocationModel.fromJson(data)).toList();
  }
  Future<List<QualificationsModel>>  getQualificationsList() async {
    String qualificationsJson = await parseJsonFromAssets("assets/json/qualifications.json");
    return (json.decode(qualificationsJson) as List).map((data) => QualificationsModel.fromJson(data)).toList();
  }
  Future<List<WorkExperienceModel>>  getWorkExperienceList() async {
    String workExperienceJson = await parseJsonFromAssets("assets/json/workexperience.json");
    return (json.decode(workExperienceJson) as List).map((data) => WorkExperienceModel.fromJson(data)).toList();
  }
  Future<List<EmployeesDetailsModel>>  getEmployeesDetailsList() async {
    String employeesDetails = await parseJsonFromAssets("assets/json/employeedetails.json");
    return (json.decode(employeesDetails) as List).map((data) => EmployeesDetailsModel.fromJson(data)).toList();
  }
}
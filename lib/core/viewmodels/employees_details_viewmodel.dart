import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/model/branches_model.dart';
import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/employees_category.dart';
import 'package:filter/core/model/employees_details_model.dart';
import 'package:filter/core/model/shifts_model.dart';
import 'package:filter/core/repositories/search_repo.dart';
import '../../locator.dart';
import 'base_model.dart';

class EmployeesDetailsViewModel extends BaseModel {

  List<EmployeesCategoryModel> employeesCategoryList = [];

  List<EmployeesDetailsModel> employeesDetailsList = [];
  List<EmployeesDetailsModel> filteredEmployeesDetailsList = [];

  List<BranchesModel> branchesList = [];
  List<BranchesModel> filteredBranchesList = [];

  List<ShiftsModel> shiftsList = [];
  List<ShiftsModel> filteredShiftsList = [];

  final SearchRepo _searchRepo = locator<SearchRepo>();
  String errorMessage;
  String selectedCategory;


  Future getEmployeesDetailsList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    employeesDetailsList = [];
    filteredEmployeesDetailsList = [];
    _searchRepo.getEmployeesDetailsList()
        .then((employeesDetails) {
      if (employeesDetails != null) {

        this.employeesDetailsList = employeesDetails;
        this.filteredEmployeesDetailsList = employeesDetails;
        if (employeesDetails.isEmpty) {
          errorMessage = "No Employees Details Found";
        }
      } else {
        errorMessage = "Failed to load Employees Details";
      }
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });

  }
  Future getBranchesList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    branchesList = [];
    filteredBranchesList = [];
    _searchRepo.getBranchesList()
        .then((branches) {
      if (branches != null) {
        this.branchesList = branches;
        this.filteredBranchesList = branches;
        if (branches.isEmpty) {
          errorMessage = "No Branches Found";
        }
      } else {
        errorMessage = "Failed to load Branches";
      }
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
  Future getShiftList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    shiftsList = [];
    filteredShiftsList = [];
    _searchRepo.getShiftsList()
        .then((shifts) {
      if (shifts != null) {
        this.shiftsList = shifts;
        this.filteredShiftsList = shifts;
        if (shifts.isEmpty) {
          errorMessage = "No Shifts Found";
        }
      } else {
        errorMessage = "Failed to load Stores";
      }
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

  Future getEmployeesCategory() async {
    setState(ViewState.Busy);
    errorMessage = null;
    employeesCategoryList = [];
    _searchRepo.getEmployeesCategoryList()
        .then((categories) {
      this.employeesCategoryList.addAll(categories);
      setState(ViewState.Idle);
      getShiftList();
      getBranchesList();

    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
  Future employeesFilter(String filterCategory) async{
    print("Selected Cat: $filterCategory");
    setState(ViewState.Busy);
    selectedCategory = filterCategory;
    if(filterCategory.isEmpty ) {
    } else {
      List tempShiftList = new List<ShiftsModel>();
      List tempBranchesList = new List<BranchesModel>();

      for (int i = 0; i < branchesList.length; i++) {
        if (branchesList[i].category.toLowerCase() == filterCategory.toLowerCase()) {
          tempBranchesList.add(branchesList[i]);
        }
      }

      for (int i = 0; i < shiftsList.length; i++) {
        if (shiftsList[i].category.toLowerCase() == filterCategory.toLowerCase()) {
          tempShiftList.add(shiftsList[i]);
        }
      }
      filteredShiftsList = tempShiftList;
      filteredBranchesList = tempBranchesList;
    }
    setState(ViewState.Idle);
  }
}
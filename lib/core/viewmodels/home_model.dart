import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/model/branches_model.dart';
import 'package:filter/core/model/search_model.dart';
import 'package:filter/core/model/category_model.dart';
import 'package:filter/core/model/shifts_model.dart';
import 'package:filter/core/repositories/search_repo.dart';
import '../../locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {

  List<CategoryModel> categoryList = [];

  List<CompanyModel> companyList = [];
  List<CompanyModel> filteredCompanyList = [];

  final SearchRepo _searchRepo = locator<SearchRepo>();
  String errorMessage;

  List<BranchesModel> branchesList = [];
  List<BranchesModel> filteredBranchesList = [];

  List<ShiftsModel> shiftsList = [];
  List<ShiftsModel> filteredShiftsList = [];
  String searchTerm;
  String selectedCategory;


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
  Future getCompanyList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    companyList = [];
    filteredCompanyList = [];
    _searchRepo.getCompanyList()
        .then((company) {
      if (company != null) {

        this.companyList = company;
        this.filteredCompanyList = company;
        if (company.isEmpty) {
          errorMessage = "No Company Found";
        }
      } else {
        errorMessage = "Failed to load Company";
      }
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });

  }


  Future getCategories() async {
    setState(ViewState.Busy);
    errorMessage = null;
    categoryList = [];
    _searchRepo.getCategoryList()
        .then((categories) {
      //this.categoryList = [CategoryModel(name: "Company")];
      this.categoryList.addAll(categories);
      setState(ViewState.Idle);
       getShiftList();
      getCompanyList();
      getBranchesList();

    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }


  Future companySearch(String searchTerm) async{
    setState(ViewState.Busy);
    if(searchTerm.isEmpty) {
      filteredCompanyList = companyList;
//      filteredShiftsList = shiftsList;
//      filteredBranchesList = branchesList;
    } else {
      List tempCompanyList = new List<CompanyModel>();
      List tempShiftList = new List<ShiftsModel>();
      List tempBranchestList = new List<BranchesModel>();
      for (int i = 0; i < branchesList.length; i++) {
        if (branchesList[i].name.toLowerCase().contains(searchTerm.toLowerCase())) {
          tempBranchestList.add(branchesList[i]);
        }
      }
      for (int i = 0; i < companyList.length; i++) {
        if (companyList[i].name.toLowerCase().contains(searchTerm.toLowerCase())) {
          tempCompanyList.add(companyList[i]);
        }
      }
      for (int i = 0; i < shiftsList.length; i++) {
        if (shiftsList[i].name.toLowerCase().contains(searchTerm.toLowerCase())) {
          tempShiftList.add(shiftsList[i]);
        }
      }
      filteredShiftsList = tempShiftList;
      filteredCompanyList = tempCompanyList;
      filteredBranchesList = tempBranchestList;
    }
    this.searchTerm = searchTerm;
    setState(ViewState.Idle);
  }

  Future companyFilter(String filterCategory) async{
    print("Selected Cat: $filterCategory");
    setState(ViewState.Busy);
    selectedCategory = filterCategory;
    if(filterCategory.isEmpty ) {
      filteredCompanyList = companyList;
//      filteredShiftsList = shiftsList;
//      filteredBranchesList = branchesList;
    } else {
      List tempCompanyList = new List<CompanyModel>();
      List tempShiftList = new List<ShiftsModel>();
      List tempBranchesList = new List<BranchesModel>();

      for (int i = 0; i < branchesList.length; i++) {
        if (branchesList[i].category.toLowerCase() == filterCategory.toLowerCase()) {
          tempBranchesList.add(branchesList[i]);
        }
      }
      for (int i = 0; i < companyList.length; i++) {
        if (companyList[i].category.toLowerCase() == filterCategory.toLowerCase()) {
          tempCompanyList.add(companyList[i]);
        }
      }
      for (int i = 0; i < shiftsList.length; i++) {
        if (shiftsList[i].category.toLowerCase() == filterCategory.toLowerCase()) {
          tempShiftList.add(shiftsList[i]);
        }
      }
      filteredShiftsList = tempShiftList;
      filteredCompanyList = tempCompanyList;
      filteredBranchesList = tempBranchesList;
    }
    setState(ViewState.Idle);
  }}
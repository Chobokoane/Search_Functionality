import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/model/store.dart';
import 'package:filter/core/model/category.dart';
import 'package:filter/core/repositories/search_repo.dart';


import '../../locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  final SearchRepo _storeRepo = locator<SearchRepo>();
  String errorMessage;
  List<Category> categoryList = [];
  List<Search> searchList = [];
  List<Search> filteredStoreList = [];
  String searchTerm;

  void init(Function onCompleteCountDown) {
    setState(ViewState.Busy);
    Future.delayed(const Duration(seconds: 2)).then((any) {
      setState(ViewState.Idle);
      onCompleteCountDown();
    });
  }
  Future getCategoryList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    categoryList = [];
    _storeRepo.getCategory()
        .then((categories) {
      this.categoryList = [Category(id: -1,name: "All")];
      this.categoryList.addAll(categories);
      setState(ViewState.Idle);
      return getAllStores();
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
  Future getEmployeesList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    searchList = [];
    filteredStoreList = [];
    _storeRepo.getEmployeesList()
        .then((stores) {
      if (stores != null) {
        this.searchList = stores;
        this.filteredStoreList = stores;
        if (stores.isEmpty) {
          errorMessage = "No Stores Found";
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
  Future getBranchesList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    searchList = [];
    filteredStoreList = [];
    _storeRepo.getBranchesList()
        .then((stores) {
      if (stores != null) {
        this.searchList = stores;
        this.filteredStoreList = stores;
        if (stores.isEmpty) {
          errorMessage = "No Stores Found";
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
  Future getShiftList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    searchList = [];
    filteredStoreList = [];
    _storeRepo.getShiftsList()
        .then((stores) {
      if (stores != null) {
        this.searchList = stores;
        this.filteredStoreList = stores;
        if (stores.isEmpty) {
          errorMessage = "No Stores Found";
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
    searchList = [];
    filteredStoreList = [];
    _storeRepo.getCompanyList()
        .then((stores) {
      if (stores != null) {
        this.searchList = stores;
        this.filteredStoreList = stores;
        if (stores.isEmpty) {
          errorMessage = "No Stores Found";
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

  Future getAllStores() async {
    setState(ViewState.Busy);
    errorMessage = null;
    searchList = [];
    filteredStoreList = [];
    _storeRepo.getStoreList()
        .then((stores) {
      if (stores != null) {
        this.searchList = stores;
        this.filteredStoreList = stores;
        if (stores.isEmpty) {
          errorMessage = "No Stores Found";
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

  Future searchStores(String searchTerm) async{
    setState(ViewState.Busy);
    if(searchTerm.isEmpty) {
      filteredStoreList = searchList;
    } else {
      List tempList = new List<Search>();
      for (int i = 0; i < searchList.length; i++) {
        if (searchList[i].name.toLowerCase().contains(searchTerm.toLowerCase())) {
          tempList.add(searchList[i]);
        }
      }
      filteredStoreList = tempList;
    }
    this.searchTerm = searchTerm;
    setState(ViewState.Idle);
  }

  Future filterStores(String filterCategory) async{
    print("Selected Cat: $filterCategory");
    setState(ViewState.Busy);
    if(filterCategory.isEmpty || filterCategory == "All") {
      filteredStoreList = searchList;
    } else {
      List tempList = new List<Search>();
      for (int i = 0; i < searchList.length; i++) {
        if (searchList[i].category.toLowerCase() == filterCategory.toLowerCase()) {
          tempList.add(searchList[i]);
        }
      }
      filteredStoreList = tempList;
    }
    setState(ViewState.Idle);
  }
}
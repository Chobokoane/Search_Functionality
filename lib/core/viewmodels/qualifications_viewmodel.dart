import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/model/qualifications_model.dart';
import 'package:filter/core/repositories/search_repo.dart';
import 'package:flutter/cupertino.dart';
import '../../locator.dart';
import 'base_model.dart';

class QualificationsViewModel extends BaseModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController institutionNameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  List<QualificationsModel> qualicationsList = [];
  List<QualificationsModel> filteredQualificationList = [];

  final SearchRepo _searchRepo = locator<SearchRepo>();
  String errorMessage;

  String searchTerm;
  String selectedCategory;

  void init() {
    errorMessage = "";
    nameController.text = "";
    institutionNameController.text = "";
    yearController.text = "";

  }


  Future getQualificationsList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    qualicationsList = [];
    filteredQualificationList = [];
    _searchRepo.getQualificationsList()
        .then((qualification) {
      if (qualification != null) {
        this.qualicationsList = qualification;
        this.filteredQualificationList = qualification;
        if (qualification.isEmpty) {
          errorMessage = "No Qualifications Found";
        }
      } else {
        errorMessage = "Failed to load Qualifications";
      }
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
}
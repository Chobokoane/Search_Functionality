import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/model/qualifications_model.dart';
import 'package:filter/core/model/work_experience_model.dart';
import 'package:filter/core/repositories/search_repo.dart';
import 'package:flutter/cupertino.dart';
import '../../locator.dart';
import 'base_model.dart';

class WorkExperienceViewModel extends BaseModel {
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  List<WorkExperienceModel> workExperiencesList = [];
  List<WorkExperienceModel> filteredWorkExperienceList = [];

  final SearchRepo _searchRepo = locator<SearchRepo>();
  String errorMessage;

  String searchTerm;
  String selectedCategory;

  void init() {
    errorMessage = "";
    employeeNameController.text = "";
    jobTitleController.text = "";
    durationController.text = "";
  }


  Future getWorkExperienceList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    workExperiencesList = [];
    filteredWorkExperienceList = [];
    _searchRepo.getWorkExperienceList()
        .then((workExperience) {
      if (workExperience != null) {
        this.workExperiencesList = workExperience;
        this.filteredWorkExperienceList = workExperience;
        if (workExperience.isEmpty) {
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
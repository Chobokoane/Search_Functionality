import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/repositories/search_repo.dart';
import 'core/viewmodels/add_qualification_viewmodel.dart';
import 'core/viewmodels/add_work_experience_viewmodel.dart';
import 'core/viewmodels/employees_details_viewmodel.dart';
import 'core/viewmodels/home_viewmodel.dart';
import 'core/viewmodels/qualifications_viewmodel.dart';
import 'core/viewmodels/register_viewmodel.dart';
import 'core/viewmodels/work_experience_viewmodel.dart';


GetIt locator = GetIt.instance;

void setupLocator({SharedPreferences sharedPreferences}) {
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => SearchRepo());
  locator.registerFactory(() => EmployeesDetailsViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => QualificationsViewModel());
  locator.registerFactory(() => AddQualificationViewModel());
  locator.registerFactory(() => WorkExperienceViewModel());
  locator.registerFactory(() => AddWorkExperienceViewModel());






}
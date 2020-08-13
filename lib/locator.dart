import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/repositories/search_repo.dart';
import 'core/viewmodels/home_model.dart';


GetIt locator = GetIt.instance;

void setupLocator({SharedPreferences sharedPreferences}) {
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => SearchRepo());





}
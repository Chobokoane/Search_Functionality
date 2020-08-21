import 'dart:async';

import 'package:filter/my_router.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/shared/core_helpers.dart';
import 'locator.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  setupLocator(sharedPreferences: sharedPreferences);
  //CoreHelpers.setErrorStyle();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CoreHelpers.setupLanguage();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: primaryColor
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sim Wallet App',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor
      ),
      onGenerateRoute: My_Router.generateRoute,
    );
  }
}

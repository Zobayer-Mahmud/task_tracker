import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/common/app_theme.dart';
import 'package:task_tracker/app/routes/app_pages.dart';
import 'package:task_tracker/di.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().initializeApp();
  runApp(
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: "Task Tracker",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}


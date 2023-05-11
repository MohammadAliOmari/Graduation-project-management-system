import 'package:flutter/material.dart';
import 'package:project_manager/layout/project_manager_layout.dart';
import 'package:project_manager/layout/project_manager_layout_admin.dart';
import 'package:project_manager/modules/all_request_page/all_request_page.dart';
import 'package:project_manager/modules/all_users_page/all_users_page.dart';
import 'package:project_manager/modules/first_screen/first_screen.dart';
import 'package:project_manager/modules/home_page/home_page.dart';
import 'package:project_manager/modules/home_page_admin/home_page_admin.dart';
import 'package:project_manager/modules/home_page_doc/home_page_doc.dart';
import 'package:project_manager/modules/login_screens/student_login.dart';
import 'package:project_manager/modules/project_info.dart';
import 'package:project_manager/modules/request_page/requst_page.dart';
import 'package:project_manager/shared/component/constant.dart';

import 'modules/login_screens/student1_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleSpacing: 20,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        primarySwatch: maincolor1,
      ),
      home: const ProjectInfo(),
    );
  }
}

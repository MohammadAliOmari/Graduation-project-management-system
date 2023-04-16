import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_manager/modules/all_request_page/all_request_page.dart';
import 'package:project_manager/modules/all_users_page/all_users_page.dart';
import 'package:project_manager/modules/home_page_admin/home_page_admin.dart';

class ProjectManagerLayoutAdmin extends StatefulWidget {
  const ProjectManagerLayoutAdmin({super.key});

  @override
  State<ProjectManagerLayoutAdmin> createState() =>
      _ProjectManagerLayoutAdminState();
}

class _ProjectManagerLayoutAdminState extends State<ProjectManagerLayoutAdmin> {
  int currentIndex = 0;
  List<String> titles = [
    'AABU Project Manager (Admin)',
    'All Request',
    'Users',
  ];
  List<Widget> screens = const [
    HomePageAdmin(),
    AllRequestPage(),
    AllUsersPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff01b397),
        title: Center(
          child: Text(
            titles[currentIndex],
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
            ),
            label: 'All Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt_outlined,
            ),
            label: 'Users',
          ),
        ],
        currentIndex: currentIndex,
      ),
    );
  }
}

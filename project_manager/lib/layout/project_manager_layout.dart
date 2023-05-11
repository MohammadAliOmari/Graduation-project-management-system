import 'package:flutter/material.dart';
import 'package:project_manager/modules/project_form%20.dart';
import 'package:project_manager/modules/request_page/requst_page.dart';
import 'package:project_manager/modules/request_status_page/request_status_page.dart';

import '../modules/home_page/home_page.dart';
import '../shared/component/component.dart';

class ProjectManagerLayout extends StatefulWidget {
  const ProjectManagerLayout({super.key});

  @override
  State<ProjectManagerLayout> createState() => _ProjectManagerLayoutState();
}

class _ProjectManagerLayoutState extends State<ProjectManagerLayout> {
  int currentIndex = 0;
  List<String> titles = [
    'AABU Project Manager',
    'Add Request',
    'Request Status',
  ];
  List<Widget> screens = [
    const HomePage(),
    const ProjectForm(),
    const RequestStatusPage(),
  ];
  void gotoRequestScreen() {
    setState(() {
      currentIndex = 1;
    });
  }

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
              Icons.add_box_rounded,
            ),
            label: 'Add Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
            ),
            label: 'Request Status',
          ),
        ],
        currentIndex: currentIndex,
      ),
    );
  }
}

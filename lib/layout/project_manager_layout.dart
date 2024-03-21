import 'package:flutter/material.dart';
import 'package:project_manager/modules/project_forms.dart';
import 'package:project_manager/modules/request_status_page/request_status_page.dart';

import '../modules/home_page/home_page.dart';
import '../modules/login_screens/main_login.dart';
import '../shared/component/constant.dart';
import '../shared/sharedPreferences/general_shared_preferences.dart';

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
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: const Icon(Icons.logout_sharp),
                      content: const Text("Are You Sure You Want To LogOut"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () async {
                            await General.remove(ConsValues.universityId);
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MainLogin();
                                },
                              ),
                            );
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              )),
        ],
        title: Center(
          child: Text(
            titles[currentIndex],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            FocusScope.of(context).unfocus();
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

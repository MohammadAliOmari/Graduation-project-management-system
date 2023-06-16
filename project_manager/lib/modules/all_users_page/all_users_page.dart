import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_manager/modules/all_users_page/edit_user_page.dart';
import '../../shared/component/component.dart';
import '../../shared/component/constant.dart';
import 'package:http/http.dart' as http;

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({super.key});

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  Future getData1() async {
    var url = "${ConsValues.BASEURL}select_all_student.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      setState(() {
        studentList.addAll(red);
      });
    }
  }

  Future getData() async {
    var url = "${ConsValues.BASEURL}select_all_doctor.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      setState(() {
        doctoList.addAll(red);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    await getData();
    getData1();
  }

  List doctoList = [];
  List studentList = [];
  bool _showList1 = true;
  bool _showList2 = false;

  Color color1 = mainColor;
  Color color2 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(color: mainColor, blurRadius: 25),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 25),
                          ],
                          color: color1,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _showList1 = true;
                              _showList2 = false;

                              color1 = const Color(0xff01b397);
                              color2 = Colors.grey;
                            });
                          },
                          child: const Text(
                            'Doctors',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 25)
                          ],
                          color: color2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _showList1 = false;
                              _showList2 = true;
                              color2 = const Color(0xff01b397);
                              color1 = Colors.grey;
                            });
                          },
                          child: const Text(
                            'Students',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_showList1)
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          navigateTo(
                              context, EditUsers(index: index, l1: doctoList));
                        },
                        child: buildUserItem(
                          name: doctoList[index]['name'],
                          id: doctoList[index]['university_id'],
                        ),
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: doctoList.length,
                    ),
                  ),
                if (_showList2)
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          navigateTo(context,
                              EditUsers(index: index, l1: studentList));
                        },
                        child: buildUserItem(
                            name: studentList[index]['name'],
                            id: studentList[index]['university_id']),
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: studentList.length,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

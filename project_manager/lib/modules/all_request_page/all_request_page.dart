import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_manager/modules/project_info_std.dart';
import 'package:project_manager/shared/component/constant.dart';
import 'package:http/http.dart' as http;
import '../../shared/component/component.dart';

class AllRequestPage extends StatefulWidget {
  const AllRequestPage({super.key});

  @override
  State<AllRequestPage> createState() => _AllRequestPageState();
}

class _AllRequestPageState extends State<AllRequestPage> {
  bool allrequest = true;
  bool pending = false;
  bool approved = false;
  bool rejected = false;
  Color color1 = mainColor;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;

  List allRequestList = [];
  List pindingList = [];
  List approvedList = [];
  List rejectedList = [];

  Future getData1() async {
    var url = "${ConsValues.baseUrl}all_request_projects.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      setState(() {
        allRequestList.addAll(red);
      });
    } else {
      return null;
    }
  }

  Future getData2() async {
    var url = "${ConsValues.baseUrl}pinding_status.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        var red = jsonDecode(res.body);
        setState(() {
          pindingList.addAll(red);
        });
      } catch (e) {
        return (e);
      }
    } else {
      return null;
    }
  }

  Future getData3() async {
    var url = "${ConsValues.baseUrl}approved_status.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        var red = jsonDecode(res.body);
        setState(() {
          approvedList.addAll(red);
        });
      } catch (e) {
        return (e);
      }
    } else {
      return null;
    }
  }

  Future getData4() async {
    var url = "${ConsValues.baseUrl}rejected_status.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        var red = jsonDecode(res.body);
        setState(() {
          rejectedList.addAll(red);
        });
      } catch (e) {
        return (e);
      }
    } else {
      return null;
    }
  }

  get() async {
    await getData1();
    getData2();
    getData3();
    getData4();
  }

  @override
  void initState() {
    super.initState();
    get();
  }

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
                color: Colors.white,
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
                              BoxShadow(color: Colors.blueGrey, blurRadius: 25),
                            ],
                            color: color1,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                allrequest = true;
                                pending = false;
                                approved = false;
                                rejected = false;
                                color1 = mainColor;
                                color2 = Colors.grey;
                                color3 = Colors.grey;
                                color4 = Colors.grey;
                              });
                            },
                            child: const Text(
                              'All Request',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
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
                                allrequest = false;
                                pending = true;
                                approved = false;
                                rejected = false;
                                color1 = Colors.grey;
                                color2 = mainColor;
                                color3 = Colors.grey;
                                color4 = Colors.grey;
                              });
                            },
                            child: const Text(
                              'Pinding',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 25)
                            ],
                            color: color3,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                allrequest = false;
                                pending = false;
                                approved = true;
                                rejected = false;
                                color1 = Colors.grey;
                                color2 = Colors.grey;
                                color3 = mainColor;
                                color4 = Colors.grey;
                              });
                            },
                            child: const Text(
                              'Approved',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 25)
                            ],
                            color: color4,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                allrequest = false;
                                pending = false;
                                approved = false;
                                rejected = true;
                                color1 = Colors.grey;
                                color2 = Colors.grey;
                                color3 = Colors.grey;
                                color4 = mainColor;
                              });
                            },
                            child: const Text(
                              'Rejected',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (allrequest)
                    if (allRequestList.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  ProjectInfoStudent(
                                    stdName1: allRequestList[index]
                                        ['student_name'],
                                    stdID1: allRequestList[index]
                                        ['university_id'],
                                    stdName2: allRequestList[index]
                                        ['std_name1'],
                                    stdID2: allRequestList[index]
                                        ['university_id1'],
                                    stdName3: allRequestList[index]
                                        ['std_name2'],
                                    stdID3: allRequestList[index]
                                        ['university_id2'],
                                    stdName4: allRequestList[index]
                                        ['std_name4'],
                                    stdID4: allRequestList[index]['std_id4'],
                                    projectName: allRequestList[index]['name'],
                                    description: allRequestList[index]
                                        ['description'],
                                    goals: allRequestList[index]['goals'],
                                    timeLine1: allRequestList[index]
                                        ['time_line'],
                                    timeLine2: allRequestList[index]
                                        ['time_line2'],
                                    docname: allRequestList[index]
                                        ['doctor_name'],
                                    docid: allRequestList[index]['id_doctor'],
                                    week1: allRequestList[index]['week1'],
                                    week2: allRequestList[index]['week2'],
                                    week3: allRequestList[index]['week3'],
                                    task1: allRequestList[index]['task1'],
                                    task2: allRequestList[index]['task2'],
                                    task3: allRequestList[index]['task3'],
                                    note: allRequestList[index]['note'],
                                  ));
                            },
                            onDoubleTap: () {},
                            child: buildRequestItem(
                                statues: allRequestList[index]['status'],
                                stcolor:
                                    allRequestList[index]['status'] == 'Pinding'
                                        ? Colors.grey
                                        : (allRequestList[index]['status'] ==
                                                'Rejected'
                                            ? Colors.red
                                            : Colors.green),
                                projectName: allRequestList[index]['name'],
                                studentName: allRequestList[index]
                                    ['student_name'],
                                time: allRequestList[index]['time']),
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: allRequestList.length,
                        ),
                      )
                    else
                      const Text(
                        'No Request Yet',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                  if (pending)
                    if (pindingList.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  ProjectInfoStudent(
                                    stdName1: pindingList[index]
                                        ['student_name'],
                                    stdID1: pindingList[index]['university_id'],
                                    stdName2: pindingList[index]['std_name1'],
                                    stdID2: pindingList[index]
                                        ['university_id1'],
                                    stdName3: pindingList[index]['std_name2'],
                                    stdID3: pindingList[index]
                                        ['university_id2'],
                                    stdName4: pindingList[index]['std_name4'],
                                    stdID4: pindingList[index]['std_id4'],
                                    projectName: pindingList[index]['name'],
                                    description: pindingList[index]
                                        ['description'],
                                    goals: pindingList[index]['goals'],
                                    timeLine1: pindingList[index]['time_line'],
                                    timeLine2: pindingList[index]['time_line2'],
                                    docid: pindingList[index]['id_doctor'],
                                    docname: pindingList[index]['doctor_name'],
                                    week1: pindingList[index]['week1'],
                                    week2: pindingList[index]['week2'],
                                    week3: pindingList[index]['week3'],
                                    task1: pindingList[index]['task1'],
                                    task2: pindingList[index]['task2'],
                                    task3: pindingList[index]['task3'],
                                    note: pindingList[index]['note'],
                                  ));
                            },
                            onDoubleTap: () {},
                            child: buildRequestItem(
                              statues: pindingList[index]['status'],
                              stcolor: Colors.grey,
                              projectName: pindingList[index]['name'],
                              studentName: pindingList[index]['student_name'],
                              time: pindingList[index]['time'],
                            ),
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: pindingList.length,
                        ),
                      )
                    else
                      const Text(
                        'No Request Yet',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                  if (approved)
                    if (approvedList.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  ProjectInfoStudent(
                                    stdName1: approvedList[index]
                                        ['student_name'],
                                    stdID1: approvedList[index]
                                        ['university_id'],
                                    stdName2: approvedList[index]['std_name1'],
                                    stdID2: approvedList[index]
                                        ['university_id1'],
                                    stdName3: approvedList[index]['std_name2'],
                                    stdID3: approvedList[index]
                                        ['university_id2'],
                                    stdName4: approvedList[index]['std_name4'],
                                    stdID4: approvedList[index]['std_id4'],
                                    projectName: approvedList[index]['name'],
                                    description: approvedList[index]
                                        ['description'],
                                    goals: approvedList[index]['goals'],
                                    timeLine1: approvedList[index]['time_line'],
                                    timeLine2: approvedList[index]
                                        ['time_line2'],
                                    docid: approvedList[index]['id_doctor'],
                                    docname: approvedList[index]['doctor_name'],
                                    week1: approvedList[index]['week1'],
                                    week2: approvedList[index]['week2'],
                                    week3: approvedList[index]['week3'],
                                    task1: approvedList[index]['task1'],
                                    task2: approvedList[index]['task2'],
                                    task3: approvedList[index]['task3'],
                                    note: approvedList[index]['note'],
                                  ));
                            },
                            onDoubleTap: () {},
                            child: buildRequestItem(
                              statues: approvedList[index]['status'],
                              stcolor: Colors.green,
                              projectName: approvedList[index]['name'],
                              studentName: approvedList[index]['student_name'],
                              time: approvedList[index]['time'],
                            ),
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: approvedList.length,
                        ),
                      )
                    else
                      const Text(
                        'No Request Yet',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                  if (rejected)
                    if (rejectedList.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  ProjectInfoStudent(
                                    stdName1: rejectedList[index]
                                        ['student_name'],
                                    stdID1: rejectedList[index]
                                        ['university_id'],
                                    stdName2: rejectedList[index]['std_name1'],
                                    stdID2: rejectedList[index]
                                        ['university_id1'],
                                    stdName3: rejectedList[index]['std_name2'],
                                    stdID3: rejectedList[index]
                                        ['university_id2'],
                                    stdName4: rejectedList[index]['std_name4'],
                                    stdID4: rejectedList[index]['std_id4'],
                                    projectName: rejectedList[index]['name'],
                                    description: rejectedList[index]
                                        ['description'],
                                    goals: rejectedList[index]['goals'],
                                    timeLine1: rejectedList[index]['time_line'],
                                    timeLine2: rejectedList[index]
                                        ['time_line2'],
                                    docid: rejectedList[index]['id_doctor'],
                                    docname: rejectedList[index]['doctor_name'],
                                    week1: rejectedList[index]['week1'],
                                    week2: rejectedList[index]['week2'],
                                    week3: rejectedList[index]['week3'],
                                    task1: rejectedList[index]['task1'],
                                    task2: rejectedList[index]['task2'],
                                    task3: rejectedList[index]['task3'],
                                    note: rejectedList[index]['note'],
                                  ));
                            },
                            onDoubleTap: () {},
                            child: buildRequestItem(
                              statues: rejectedList[index]['status'],
                              stcolor: Colors.red,
                              projectName: rejectedList[index]['name'],
                              studentName: rejectedList[index]['student_name'],
                              time: rejectedList[index]['time'],
                            ),
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: rejectedList.length,
                        ),
                      )
                    else
                      const Text(
                        'No Request Yet',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                ],
              ),
            ),
          ),
        ));
  }
}

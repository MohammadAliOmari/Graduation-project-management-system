// ignore_for_file: no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_manager/modules/project_info.dart';
import 'package:project_manager/shared/component/constant.dart';
import 'package:http/http.dart' as http;
import '../../model/all_doctor_request.dart';
import '../../model/users_model.dart';
import '../../shared/component/component.dart';
import '../../shared/sharedPreferences/generalSharedPreferences.dart';

class AllRequestPageDoc extends StatefulWidget {
  const AllRequestPageDoc({super.key});

  @override
  State<AllRequestPageDoc> createState() => _AllRequestPageDocState();
}

class _AllRequestPageDocState extends State<AllRequestPageDoc> {
  AllDoctorRequestModel allDoctorProject = AllDoctorRequestModel.empty();

  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    // General.getPrefString(ConsValues.name, "").then((value) {
    //   setState(() {
    //     ConsValues.name = value;
    //   });
    // });

    //  var x = await General.getPrefString("id_doctor", "").then((value) {
    //     setState(() {
    //       ConsValues.university_id = value;
    //     });
    //   });
    await getProject(ConsValues.university_id);
  }

  Future<AllDoctorRequestModel> getProject(String universityId) async {
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}all_doctor_request.php"),
      body: {'id_doctor': universityId},
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      //var red=jsonBody;
      setState(() {
        allDoctorProject = AllDoctorRequestModel.fromJson(jsonBody);
        //requestState.addAll(red);
      });

      // projects=RequestStatus.fromJson(response.body);
      // return projects;
      return allDoctorProject; //status
    } else {
      return AllDoctorRequestModel.empty();
    }
  }

  bool allrequest = true;
  bool pending = false;
  bool approved = false;
  bool rejected = false;
  Color color1 = mainColor;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff01b397),
        title: const Center(
          child: Text(
            'All Request Page',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: allDoctorProject.users.isNotEmpty
          ? Padding(
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //           boxShadow: const [
                      //             BoxShadow(color: Colors.blueGrey, blurRadius: 25),
                      //           ],
                      //           color: color1,
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: TextButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               allrequest = true;
                      //               pending = false;
                      //               approved = false;
                      //               rejected = false;
                      //               color1 = mainColor;
                      //               color2 = Colors.grey;
                      //               color3 = Colors.grey;
                      //               color4 = Colors.grey;
                      //             });
                      //           },
                      //           child: const Text(
                      //             'All Request',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 13.0,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10.0,
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //           boxShadow: const [
                      //             BoxShadow(color: Colors.grey, blurRadius: 25)
                      //           ],
                      //           color: color2,
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: TextButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               allrequest = false;
                      //               pending = true;
                      //               approved = false;
                      //               rejected = false;
                      //               color1 = Colors.grey;
                      //               color2 = mainColor;
                      //               color3 = Colors.grey;
                      //               color4 = Colors.grey;
                      //             });
                      //           },
                      //           child: const Text(
                      //             'Pending',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 13.0,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10.0,
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //           boxShadow: const [
                      //             BoxShadow(color: Colors.grey, blurRadius: 25)
                      //           ],
                      //           color: color3,
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: TextButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               allrequest = false;
                      //               pending = false;
                      //               approved = true;
                      //               rejected = false;
                      //               color1 = Colors.grey;
                      //               color2 = Colors.grey;
                      //               color3 = mainColor;
                      //               color4 = Colors.grey;
                      //             });
                      //           },
                      //           child: const Text(
                      //             'Approved',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 13.0,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10.0,
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //           boxShadow: const [
                      //             BoxShadow(color: Colors.grey, blurRadius: 25)
                      //           ],
                      //           color: color4,
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         child: TextButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               allrequest = false;
                      //               pending = false;
                      //               approved = false;
                      //               rejected = true;
                      //               color1 = Colors.grey;
                      //               color2 = Colors.grey;
                      //               color3 = Colors.grey;
                      //               color4 = mainColor;
                      //             });
                      //           },
                      //           child: const Text(
                      //             'Rejected',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 13.0,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 20,
                      ),

                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  ProjectInfo(
                                    stdName1: allDoctorProject
                                        .users[index].studentName,
                                    stdName2:
                                        allDoctorProject.users[index].stdName1,
                                    stdName3:
                                        allDoctorProject.users[index].stdName2,
                                    stdName4:
                                        allDoctorProject.users[index].stdName4,
                                    stdID1: allDoctorProject
                                        .users[index].universityId,
                                    stdID2: allDoctorProject
                                        .users[index].universityId1,
                                    stdID3: allDoctorProject
                                        .users[index].universityId2,
                                    stdID4:
                                        allDoctorProject.users[index].stdId4,
                                    projectName:
                                        allDoctorProject.users[index].name,
                                    description: allDoctorProject
                                        .users[index].description,
                                    goals: allDoctorProject.users[index].goals,
                                    timeLine1:
                                        allDoctorProject.users[index].timeLine,
                                    timeLine2:
                                        allDoctorProject.users[index].timeLine2,
                                    docid:
                                        allDoctorProject.users[index].idDoctor,
                                    docname: allDoctorProject
                                        .users[index].doctorName,
                                    note: allDoctorProject.users[index].note,
                                    week1: allDoctorProject.users[index].week1,
                                    task1: allDoctorProject.users[index].task1,
                                    week2: allDoctorProject.users[index].week2,
                                    task2: allDoctorProject.users[index].task2,
                                    week3: allDoctorProject.users[index].week3,
                                    task3: allDoctorProject.users[index].task3,
                                  ));
                            },
                            onDoubleTap: () {},
                            child: buildRequestItem(
                              statues: allDoctorProject.users[index].status,
                              stcolor: Colors.blue,
                              projectName: allDoctorProject.users[index].name,
                              studentName:
                                  allDoctorProject.users[index].studentName,
                            ),
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: allDoctorProject.users.length,
                        ),
                      ),
                      // if (pending)
                      //   Expanded(
                      //     child: ListView.separated(
                      //       scrollDirection: Axis.vertical,
                      //       shrinkWrap: true,
                      //       itemBuilder: (context, index) => buildRequestItem(
                      //           statues: 'Pending', stcolor: Colors.grey, projectName: '', studentName: ''),
                      //       separatorBuilder: (context, index) => myDivider(),
                      //       itemCount: 15,
                      //     ),
                      //   ),
                      // if (approved)
                      //   Expanded(
                      //     child: ListView.separated(
                      //       scrollDirection: Axis.vertical,
                      //       shrinkWrap: true,
                      //       itemBuilder: (context, index) => buildRequestItem(
                      //           statues: 'Approved', stcolor: Colors.green, projectName: '', studentName: ''),
                      //       separatorBuilder: (context, index) => myDivider(),
                      //       itemCount: 15,
                      //     ),
                      //   ),
                      // if (rejected)
                      //   Expanded(
                      //     child: ListView.separated(
                      //       scrollDirection: Axis.vertical,
                      //       shrinkWrap: true,
                      //       itemBuilder: (context, index) => buildRequestItem(
                      //           statues: 'Rejected', stcolor: Colors.red, projectName: '', studentName: ''),
                      //       separatorBuilder: (context, index) => myDivider(),
                      //       itemCount: 15,
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

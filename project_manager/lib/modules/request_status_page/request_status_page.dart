import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_manager/shared/component/component.dart';
import 'package:project_manager/shared/component/constant.dart';

import '../../model/request_status_model.dart';
import '../../shared/sharedPreferences/general_shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../project_info_std.dart';

class RequestStatusPage extends StatefulWidget {
  const RequestStatusPage({super.key});

  @override
  State<RequestStatusPage> createState() => _RequestStatusPageState();
}

class _RequestStatusPageState extends State<RequestStatusPage> {
  RequestStatus projectStatus = RequestStatus.empty();
  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    General.getPrefString(ConsValues.name, "").then((value) {
      setState(() {
        ConsValues.name = value;
      });
    });

    General.getPrefString("university_id", "").then((value) {
      setState(() {
        ConsValues.universityId = value;
      });
    });
    await getProject(ConsValues.universityId);
  }

  Future<RequestStatus> getProject(String universityId) async {
    final response = await http.post(
      Uri.parse("${ConsValues.baseUrl}getInfo_needProID.php"),
      body: {'university_id': universityId},
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      // var project = jsonBody["project"];
      //var red=jsonBody;
      setState(() {
        projectStatus = RequestStatus.fromJson(jsonBody);
        //requestState.addAll(red);
      });

      // projects=RequestStatus.fromJson(response.body);
      // return projects;
      return projectStatus; //status
    } else {
      return RequestStatus.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: projectStatus.projects.isNotEmpty
          ? Padding(
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
                  child: Column(children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,

                        //  separatorBuilder: (context, index) => const SizedBox(
                        //     height: 20.0,
                        //   ),
                        //   itemCount: projectStatus.projects.length, shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            navigateTo(
                                context,
                                ProjectInfoStudent(
                                  stdName1:
                                      projectStatus.projects[index].studentName,
                                  stdName2:
                                      projectStatus.projects[index].stdName1,
                                  stdName3:
                                      projectStatus.projects[index].stdName2,
                                  stdName4:
                                      projectStatus.projects[index].stdName4,
                                  stdID1: projectStatus
                                      .projects[index].universityId,
                                  stdID2: projectStatus
                                      .projects[index].universityId1,
                                  stdID3: projectStatus
                                      .projects[index].universityId2,
                                  stdID4: projectStatus.projects[index].stdId4,
                                  projectName:
                                      projectStatus.projects[index].name,
                                  description:
                                      projectStatus.projects[index].description,
                                  goals: projectStatus.projects[index].goals,
                                  timeLine1:
                                      projectStatus.projects[index].timeLine,
                                  timeLine2:
                                      projectStatus.projects[index].timeLine2,
                                  docname:
                                      projectStatus.projects[index].doctorName,
                                  docid: projectStatus.projects[index].idDoctor,
                                  week1: projectStatus.projects[index].week1,
                                  week2: projectStatus.projects[index].week2,
                                  week3: projectStatus.projects[index].week3,
                                  task1: projectStatus.projects[index].task1,
                                  task2: projectStatus.projects[index].task2,
                                  task3: projectStatus.projects[index].task3,
                                  note: projectStatus.projects[index].note,
                                ));
                          },
                          onDoubleTap: () {},
                          child: buildRequestItem(
                            statues: projectStatus.projects[index].status,
                            projectName: projectStatus.projects[index].name,
                            studentName:
                                projectStatus.projects[index].studentName,
                            stcolor: projectStatus.projects[index].status ==
                                    'Pinding'
                                ? Colors.grey
                                : (projectStatus.projects[index].status ==
                                        'Rejected'
                                    ? Colors.red
                                    : Colors.green),
                            time: projectStatus.projects[index].time,
                          ),
                        ),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: projectStatus.projects.length,
                      ),
                    ),
                  ]),
                ),
              ),
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Center(
                //   child: CircularProgressIndicator(
                //     color: Colors.white,
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Center(
                  child: Text(
                    'No Request yet',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54),
                  ),
                ),
              ],
            ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_manager/modules/project_info.dart';
import 'package:project_manager/shared/component/component.dart';
import 'package:project_manager/shared/component/constant.dart';

import '../../model/requestStatus_model.dart';
import '../../shared/sharedPreferences/generalSharedPreferences.dart';
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
        ConsValues.university_id = value;
      });
    });
    await getProject(ConsValues.university_id);
  }

  Future<RequestStatus> getProject(String universityId) async {
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}getInfo_needProID.php"),
      body: {'university_id': universityId},
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var project = jsonBody["project"];
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
                      child: GestureDetector(
                        onTap: () {
                          navigateTo(
                              context,
                              ProjectInfoStudent(
                                stdName1:
                                    projectStatus.projects.first.studentName,
                                stdName2: projectStatus.projects.first.stdName1,
                                stdName3: projectStatus.projects.first.stdName2,
                                stdName4: projectStatus.projects.first.stdName4,
                                stdID1:
                                    projectStatus.projects.first.universityId,
                                stdID2:
                                    projectStatus.projects.first.universityId1,
                                stdID3:
                                    projectStatus.projects.first.universityId2,
                                stdID4: projectStatus.projects.first.stdId4,
                                projectName: projectStatus.projects.first.name,
                                description:
                                    projectStatus.projects.first.description,
                                goals: projectStatus.projects.first.goals,
                                timeLine1:
                                    projectStatus.projects.first.timeLine,
                                timeLine2:
                                    projectStatus.projects.first.timeLine2,
                                docname:
                                    projectStatus.projects.first.doctorName,
                                docid: projectStatus.projects.first.idDoctor,
                                note: projectStatus.projects.first.note,
                              ));
                        },
                        onDoubleTap: () {},
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => buildRequestItem(
                              statues: projectStatus.projects[index].status,
                              projectName: projectStatus.projects[index].name,
                              studentName:
                                  projectStatus.projects[index].studentName,
                              stcolor: Colors.grey),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20.0,
                          ),
                          itemCount: 1,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

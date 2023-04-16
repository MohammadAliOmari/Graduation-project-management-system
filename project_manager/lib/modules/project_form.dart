import 'package:flutter/material.dart';
import 'package:project_manager/shared/component/constant.dart';

import '../shared/component/component.dart';

class ProjectForm extends StatefulWidget {
  const ProjectForm({super.key});

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  _ProjectFormState() {
    doctorSelected = selectedDoctors[0];
  }
  var studentName1 = TextEditingController();
  var studentName2 = TextEditingController();
  var studentName3 = TextEditingController();
  var studentId1 = TextEditingController();
  var studentId2 = TextEditingController();
  var studentId3 = TextEditingController();
  var projectName = TextEditingController();
  var projectDescription = TextEditingController();
  var projectGoals = TextEditingController();
  var projectTime = TextEditingController();
  var projectFormKey = GlobalKey<FormState>();
  List selectedDoctors = ['Wael qassas', 'Ahmed Alturk', 'Abdullah Alrosan'];
  String doctorSelected = "wael qassas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: projectFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: projectFormTextForm(
                          //STUD name1
                          controller: studentName1,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Name must not be empty!";
                            }
                          },
                          label: "Student name",
                          prefix: Icons.abc,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: projectFormTextForm(
                          //STUD ID1
                          controller: studentId1,
                          type: TextInputType.number,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "ID must not be empty";
                            }
                            if (value.length != 10) {
                              return "Invalid ID";
                            }
                            return null;
                          },
                          label: "Student ID",
                          prefix: Icons.numbers,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: projectFormTextForm(
                          //STUD name2
                          controller: studentName2,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Name must not be empty!";
                            }
                          },
                          label: "Student name",
                          prefix: Icons.abc,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: projectFormTextForm(
                          //STUD Id2
                          controller: studentId2,
                          type: TextInputType.number,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "ID must not be empty";
                            }
                            if (value.length != 10) {
                              return "Invalid ID";
                            }
                            return null;
                          },
                          label: "Student ID",
                          prefix: Icons.numbers,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: projectFormTextForm(
                          //STUD name3
                          controller: studentName3,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Name must not be empty !";
                            }
                          },
                          label: "Student name",
                          prefix: Icons.abc,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: projectFormTextForm(
                          //STUD Id3
                          controller: studentId3,
                          type: TextInputType.number,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "ID must not be empty";
                            }
                            if (value.length != 10) {
                              return "Invalid ID";
                            }
                            return null;
                          },
                          label: "Student ID",
                          prefix: Icons.numbers,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Select doctor :",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                DropdownButtonFormField(
                  icon: const Icon(
                    Icons.arrow_downward_rounded,
                    color: mainColor,
                    // color: Colors.green,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.format_list_bulleted),
                    // prefixIconColor: Colors.green,
                    border: OutlineInputBorder(),
                  ),
                  value: doctorSelected,
                  items: selectedDoctors
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      doctorSelected = value as String;
                    });
                  },
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Project Info :",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                projectFormTextForm(
                  //project name
                  controller: projectName,
                  type: TextInputType.name,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Project name must not be empty !";
                    }
                    return null;
                  },
                  label: "Project name",
                  prefix: Icons.text_fields,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                projectFormTextForm(
                  //project desc
                  controller: projectDescription,
                  type: TextInputType.name,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Project description must not be empty !";
                    }
                    return null;
                  },
                  label: "Project description",
                  prefix: Icons.text_fields,
                  maxLine: 5,
                  minLine: 1,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                projectFormTextForm(
                  //project goal
                  controller: projectGoals,
                  type: TextInputType.name,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "project goals must not be empty !";
                    }
                    return null;
                  },
                  label: "project goals",
                  prefix: Icons.text_fields,
                  maxLine: 5,
                  minLine: 1,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                projectFormTextForm(
                  //project timeLine
                  controller: projectTime,
                  type: TextInputType.name,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "project Time Line must not be empty !";
                    }
                    return null;
                  },
                  label: "project Time Line",
                  prefix: Icons.text_fields,
                  maxLine: 5,
                  minLine: 1,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defualtButton(
                  radius: 40.0,
                  text: "Submit",
                  function: () {
                    if (projectFormKey.currentState!.validate()) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

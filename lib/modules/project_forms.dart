import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_manager/shared/component/constant.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../model/doctor_list_model.dart';
import '../provider/doctor_list_provider.dart';
import '../shared/component/component.dart';

class ProjectForm extends StatefulWidget {
  const ProjectForm({super.key});
  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  TextEditingController studentName1 = TextEditingController();
  TextEditingController studentName2 = TextEditingController();
  TextEditingController studentName3 = TextEditingController();
  TextEditingController studentName4 = TextEditingController();
  TextEditingController studentId1 = TextEditingController();
  TextEditingController studentId2 = TextEditingController();
  TextEditingController studentId3 = TextEditingController();
  TextEditingController studentId4 = TextEditingController();
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  TextEditingController projectGoals = TextEditingController();
  TextEditingController projectTimeFrom = TextEditingController();
  TextEditingController projectTimeWeek1 = TextEditingController();
  TextEditingController projectTimeWeek2 = TextEditingController();
  TextEditingController projectTimeWeek3 = TextEditingController();
  TextEditingController projectTimeTo = TextEditingController();
  TextEditingController projectTimeTask1 = TextEditingController();
  TextEditingController projectTimeTask2 = TextEditingController();
  TextEditingController projectTimeTask3 = TextEditingController();
  var projectFormKey = GlobalKey<FormState>();

  // var time1 = DateTime.now();

  DoctorNameModel? selectedValue;
  String universityId = "";
  String docName = "";
  List<dynamic> doctorList = [];
  // Future getdata() async {
  //   var res =
  //       await http.get(Uri.parse("${ConsValues.BASEURL}select_users.php"));
  //   var jsonbody = res.body;
  //   var jsonData = json.decode(jsonbody);
  //   setState(() {
  //     doctorList = jsonData;
  //   });
  //   return "success";
  // }
  void clearTextFormField() {
    studentName1.clear();
    studentName2.clear();
    studentName3.clear();
    studentName4.clear();
    studentId1.clear();
    studentId2.clear();
    studentId3.clear();
    studentId4.clear();
    projectName.clear();
    projectDescription.clear();
    projectGoals.clear();
    projectTimeFrom.clear();
    projectTimeWeek1.clear();
    projectTimeWeek2.clear();
    projectTimeWeek3.clear();
    projectTimeTo.clear();
    projectTimeTask1.clear();
    projectTimeTask2.clear();
    projectTimeTask3.clear();
  }

  @override
  void initState() {
    // getdata();
    Provider.of<DoctorProvider>(context, listen: false).getdoctorname();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var time = DateFormat.jms().format(DateTime.now());
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
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
                              return null;
                            },
                            label: "Student name",
                            hint: "Team leader",
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
                            //STUD name1
                            controller: studentName2,
                            type: TextInputType.name,
                            validator: (value) {
                              return null;
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
                              controller: studentId2,
                              type: TextInputType.number,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length < 10) {
                                  return "Invalid ID";
                                }
                                return null;
                              },
                              label: "Student ID",
                              prefix: Icons.numbers,
                              listInputFormatter: [
                                LengthLimitingTextInputFormatter(10),
                              ]),
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
                            controller: studentName3,
                            type: TextInputType.name,
                            validator: (value) {
                              return null;
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
                            controller: studentId3,
                            type: TextInputType.number,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length < 10) {
                                return "Invalid ID";
                              }
                              return null;
                            },
                            label: "Student ID",
                            prefix: Icons.numbers,
                            listInputFormatter: [
                              LengthLimitingTextInputFormatter(10),
                            ],
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
                            controller: studentName4,
                            type: TextInputType.name,
                            validator: (value) {
                              return null;
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
                            controller: studentId4,
                            type: TextInputType.number,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length < 10) {
                                return "Invalid ID";
                              }
                              return null;
                            },
                            label: "Student ID",
                            prefix: Icons.numbers,
                            listInputFormatter: [
                              LengthLimitingTextInputFormatter(10),
                            ],
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
                  Consumer<DoctorProvider>(
                    builder: (context, value, child) {
                      return DropdownButtonFormField<DoctorNameModel>(
                        hint: const Text('Select Doctor'),
                        isExpanded: true,
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

                        value: selectedValue,
                        items: value.listDoctorName
                            .map<DropdownMenuItem<DoctorNameModel>>(
                                (DoctorNameModel value) {
                          return DropdownMenuItem<DoctorNameModel>(
                            value: value,
                            child: Text(value.docName),
                          );
                        }).toList(),
                        style: const TextStyle(color: Colors.black),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.black,
                        // ),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                            universityId = selectedValue!.docID;
                            docName = selectedValue!.docName;
                          });
                        },
                      );
                    },
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
                  const Text(
                    //paksndokasndlkasndandnajdajdjad
                    "Project timeLine :",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 200.0,
                          child: projectFormTextForm(
                            //STUD name1
                            controller: projectTimeFrom,
                            type: TextInputType.name,
                            hint: "00-00-0000",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Project timeLine must not be empty!";
                              }
                              return null;
                            },
                            label: "From",
                            prefix: Icons.access_time_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200.0,
                          child: projectFormTextForm(
                            //STUD ID1
                            controller: projectTimeTo,
                            type: TextInputType.name,
                            hint: "00-00-0000",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "project timeLine must not be empty !";
                              }
                              return null;
                            },
                            label: "To",
                            prefix: Icons.access_time_outlined,
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
                            //STUD name1
                            controller: projectTimeWeek1,
                            type: TextInputType.name,
                            hint: "week",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "week must not be empty!";
                              }
                              return null;
                            },
                            label: "week",
                            prefix: Icons.access_time_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200.0,
                          child: projectFormTextForm(
                            //STUD ID1
                            controller: projectTimeTask1,
                            type: TextInputType.name,
                            hint: "Task",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "task must not be empty !";
                              }
                              return null;
                            },
                            label: "Task",
                            prefix: Icons.access_time_outlined,
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
                            //STUD name1
                            controller: projectTimeWeek2,
                            type: TextInputType.name,
                            hint: "week",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "week must not be empty!";
                              }
                              return null;
                            },
                            label: "week",
                            prefix: Icons.access_time_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200.0,
                          child: projectFormTextForm(
                            //STUD ID1
                            controller: projectTimeTask2,
                            type: TextInputType.name,
                            hint: "Task",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "task must not be empty !";
                              }
                              return null;
                            },
                            label: "Task",
                            prefix: Icons.access_time_outlined,
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
                            //STUD name1
                            controller: projectTimeWeek3,
                            type: TextInputType.name,
                            hint: "week",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "week must not be empty!";
                              }
                              return null;
                            },
                            label: "week",
                            prefix: Icons.access_time_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200.0,
                          child: projectFormTextForm(
                            //STUD ID1
                            controller: projectTimeTask3,
                            type: TextInputType.name,
                            hint: "Task",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "task must not be empty !";
                              }
                              return null;
                            },
                            label: "Task",
                            prefix: Icons.access_time_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtButton(
                    radius: 40.0,
                    text: "Submit",
                    function: () {
                      setState(() {
                        time;
                      });
                      if (projectFormKey.currentState!.validate()) {
                        insertinfo();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   Provider.of<doctor_prov>(context, listen: false).clearList();
  // }

  void insertinfo() async {
    String time = DateFormat('h:m a d/MM/yyyy').format(DateTime.now());
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.baseUrl}insert_form.php"),
      body: {
        "student_name": studentName1.text,
        "university_id": studentId1.text,
        "std_name1": studentName2.text,
        "university_id1": studentId2.text,
        "std_name2": studentName3.text,
        "university_id2": studentId3.text,
        "std_name4": studentName4.text,
        "std_id4": studentId4.text,
        "id_doctor": universityId,
        "doctor_name": docName,
        "name": projectName.text,
        "description": projectDescription.text,
        "goals": projectGoals.text,
        "time_line": projectTimeFrom.text,
        "time_line2": projectTimeTo.text,
        "week1": projectTimeWeek1.text,
        "task1": projectTimeTask1.text,
        "week2": projectTimeWeek2.text,
        "task2": projectTimeTask2.text,
        "week3": projectTimeWeek3.text,
        "task3": projectTimeTask3.text,
        "time": time.toString(),
      },
    );
    EasyLoading.dismiss();
    if (!mounted) return;
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.check),
            content:
                const SizedBox(height: 30, child: Center(child: Text("Done"))),
            actions: [
              TextButton(
                onPressed: () {
                  clearTextFormField();
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.error),
            content: const Text("The insert information is not sucess"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("ok"),
              ),
            ],
          );
        },
      );
    }
  }
}

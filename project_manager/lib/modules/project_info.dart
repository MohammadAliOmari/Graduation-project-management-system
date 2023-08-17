import 'package:flutter/material.dart';
import 'package:project_manager/modules/home_page_doc/home_page_doc.dart';
import 'package:project_manager/shared/component/component.dart';
import 'package:http/http.dart' as http;
import '../shared/component/constant.dart';

class ProjectInfo extends StatefulWidget {
  final String stdName1;
  final String stdName2;
  final String stdName3;
  final String stdName4;
  final String stdID1;
  final String stdID2;
  final String stdID3;
  final String stdID4;
  final String projectName;
  final String description;
  final String goals;
  final String timeLine1;
  final String timeLine2;
  final String docname;
  final String docid;
  final String week1;
  final String task1;
  final String week2;
  final String task2;
  final String week3;
  final String task3;
  final String note;
  const ProjectInfo({
    super.key,
    required this.stdName1,
    required this.stdName2,
    required this.stdName3,
    required this.stdName4,
    required this.stdID1,
    required this.stdID2,
    required this.stdID3,
    required this.stdID4,
    required this.projectName,
    required this.description,
    required this.goals,
    required this.timeLine1,
    required this.timeLine2,
    required this.docname,
    required this.docid,
    required this.note,
    required this.week1,
    required this.task1,
    required this.week2,
    required this.task2,
    required this.week3,
    required this.task3,
  });

  @override
  State<ProjectInfo> createState() => _ProjectInfoState(
      // studentName1: stdName1,
      // studentName2: stdName2,
      // studentName3: stdName3,
      // studentName4: stdName4,
      // stdID1: stdID1,
      // stdID2: stdID2,
      // stdID3: stdID3,
      // stdID4: stdID4,
      // projectName: projectName,
      // description: description,
      // goals: goals,
      // timeLine1: timeLine1,
      // timeLine2: timeLine2,
      // docid: docid,
      // docname: docname,
      // note: note,
      // week1: week1,
      // week2: week2,
      // week3: week3,
      // task1: task1,
      // task2: task2,
      // task3: task3,
      );
}

class _ProjectInfoState extends State<ProjectInfo> {
  // String studentName1;
  // String studentName2;
  // String studentName3;
  // String studentName4;
  // String stdID1;
  // String stdID2;
  // String stdID3;
  // String stdID4;
  // String projectName;
  // String description;
  // String goals;
  // String timeLine1;
  // String timeLine2;
  // String docid;
  // String docname;
  // String week1;
  // String task1;
  // String week2;
  // String task2;
  // String week3;
  // String task3;
  // String note;
  // _ProjectInfoState({
  //   required this.studentName1,
  //   required this.studentName2,
  //   required this.studentName3,
  //   required this.studentName4,
  //   required this.stdID1,
  //   required this.stdID2,
  //   required this.stdID3,
  //   required this.stdID4,
  //   required this.projectName,
  //   required this.description,
  //   required this.goals,
  //   required this.timeLine1,
  //   required this.timeLine2,
  //   required this.docid,
  //   required this.docname,
  //   required this.note,
  //   required this.week1,
  //   required this.task1,
  //   required this.week2,
  //   required this.task2,
  //   required this.week3,
  //   required this.task3,

  TextEditingController noteControler = TextEditingController();
  Future changeState(stdID1) async {
    var url = "${ConsValues.baseUrl}change_state_approved.php";
    var res = await http.post(Uri.parse(url), body: {'university_id': stdID1});
    if (res.statusCode == 200) {
      // var jsonBody = jsonDecode(res.body);
    }
  }

  Future changeStateRejected(stdID1) async {
    var url = "${ConsValues.baseUrl}change_state_rejected.php";
    var res = await http.post(Uri.parse(url), body: {'university_id': stdID1});
    if (res.statusCode == 200) {
      // var jsonBody = jsonDecode(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: const Text(
          "Project Information",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/student.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.stdName1,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            widget.stdID1,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/student.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.stdName2,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            widget.stdID2,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/student.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.stdName3,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            widget.stdID3,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/student.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.stdName4,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            widget.stdID4,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/doctor.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.docname,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            widget.docid,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/project-name.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.projectName,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/job-description.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              widget.description,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/goals.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              widget.goals,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/timeline.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Project Timeline",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        widget.timeLine1,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "TO",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        widget.timeLine2,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/week.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.week1,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/task.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.task1,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/week.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.week2,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/task.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.task2,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/week.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.week3,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/task.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.task3,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
              myDivider(),
              Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/note.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.note,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defualtButton(
                    text: "Approved",
                    function: () {
                      changeState(widget.stdID1);
                      navigateTo(context, const HomePageDoc());
                    },
                    radius: 40,
                    width: 150,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  defualtButton(
                      text: "Rejected",
                      function: () {
                        addNote();
                      },
                      radius: 40,
                      width: 150,
                      backGroundClolor: Colors.red),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future updateNote(stdID1) async {
    var url = "${ConsValues.baseUrl}updateNote.php";
    var res = await http.post(Uri.parse(url), body: {
      'university_id': stdID1,
      'note': noteControler.text,
    });
    if (res.statusCode == 200) {
      // var jsonBody = jsonDecode(res.body);
    }
  }

  addNote() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                const Text("Write Note Why You Rejected"),
                const SizedBox(
                  height: 10,
                ),
                defualtTextForm(
                    controller: noteControler,
                    type: TextInputType.text,
                    validator: (value) {
                      return '';
                    },
                    label: 'Note',
                    prefix: Icons.note_alt_outlined),
                const SizedBox(
                  height: 10,
                ),
                defualtButton(
                    radius: 40,
                    text: 'Send',
                    function: () {
                      updateNote(widget.stdID1);
                      changeStateRejected(widget.stdID1);
                      navigateTo(context, const HomePageDoc());
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}

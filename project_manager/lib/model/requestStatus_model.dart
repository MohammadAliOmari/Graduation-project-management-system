import 'dart:convert';

RequestStatus requestStatusFromJson(String str) =>
    RequestStatus.fromJson(json.decode(str));

String requestStatusToJson(RequestStatus data) => json.encode(data.toJson());

class RequestStatus {
  List<Project> projects;

  RequestStatus({
    required this.projects,
  });
  factory RequestStatus.empty() {
    return RequestStatus(projects: []);
  }
  factory RequestStatus.fromJson(Map<String, dynamic> json) => RequestStatus(
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Project {
  String idProject;
  String name;
  String description;
  String goals;
  String status;
  dynamic idDoctor;
  String doctorName;
  String studentName;
  String stdName1;
  String stdName2;
  String stdName4;
  String universityId;
  String universityId1;
  String universityId2;
  String stdId4;
  String timeLine;
  String timeLine2;
  String week1;
  String task1;
  String week2;
  String task2;
  String week3;
  String task3;
  String note;

  Project({
    required this.idProject,
    required this.name,
    required this.description,
    required this.goals,
    required this.status,
    this.idDoctor,
    required this.doctorName,
    required this.studentName,
    required this.stdName1,
    required this.stdName2,
    required this.stdName4,
    required this.universityId,
    required this.universityId1,
    required this.universityId2,
    required this.stdId4,
    required this.timeLine,
    required this.timeLine2,
    required this.week1,
    required this.task1,
    required this.week2,
    required this.task2,
    required this.week3,
    required this.task3,
    required this.note,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        idProject: json["id_project"],
        name: json["name"],
        description: json["description"],
        goals: json["goals"],
        status: json["status"],
        idDoctor: json["id_doctor"],
        doctorName: json["doctor_name"],
        studentName: json["student_name"],
        stdName1: json["std_name1"],
        stdName2: json["std_name2"],
        stdName4: json["std_name4"],
        universityId: json["university_id"],
        universityId1: json["university_id1"],
        universityId2: json["university_id2"],
        stdId4: json["std_id4"],
        timeLine: json["time_line"],
        timeLine2: json["time_line2"],
        week1: json["week1"],
        week2: json["week2"],
        week3: json["week3"],
        task1: json["task1"],
        task2: json["task2"],
        task3: json["task3"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id_project": idProject,
        "name": name,
        "description": description,
        "goals": goals,
        "status": status,
        "id_doctor": idDoctor,
        "doctor_name": doctorName,
        "student_name": studentName,
        "std_name1": stdName1,
        "std_name2": stdName2,
        "std_name4": stdName4,
        "university_id": universityId,
        "university_id1": universityId1,
        "university_id2": universityId2,
        "std_id4": stdId4,
        "time_line": timeLine,
        "time_line2": timeLine2,
        "note": note,
        "week1": week1,
        "week2": week2,
        "week3": week3,
        "task1": task1,
        "task2": task2,
        "task3": task3,
      };
}

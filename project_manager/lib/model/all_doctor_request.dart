import 'dart:convert';

AllDoctorRequestModel allDoctorRequestFromJson(String str) =>
    AllDoctorRequestModel.fromJson(json.decode(str));

String allDoctorRequestToJson(AllDoctorRequestModel data) =>
    json.encode(data.toJson());

class AllDoctorRequestModel {
  List<User> users;

  AllDoctorRequestModel({
    required this.users,
  });
  factory AllDoctorRequestModel.empty() {
    return AllDoctorRequestModel(users: []);
  }
  factory AllDoctorRequestModel.fromJson(Map<String, dynamic> json) =>
      AllDoctorRequestModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  String name;
  String description;
  String goals;
  String timeLine;
  String status;
  String idDoctor;
  String studentName;
  String universityId;
  String stdName1;
  String stdName2;
  String universityId1;
  String universityId2;
  String timeLine2;
  String stdName4;
  String stdId4;
  String week1;
  String task1;
  String week2;
  String task2;
  String week3;
  String task3;
  String doctorName;
  String note;

  User({
    required this.name,
    required this.description,
    required this.goals,
    required this.timeLine,
    required this.status,
    required this.idDoctor,
    required this.studentName,
    required this.universityId,
    required this.stdName1,
    required this.stdName2,
    required this.universityId1,
    required this.universityId2,
    required this.timeLine2,
    required this.stdName4,
    required this.stdId4,
    required this.week1,
    required this.task1,
    required this.week2,
    required this.task2,
    required this.week3,
    required this.task3,
    required this.doctorName,
    required this.note,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        description: json["description"],
        goals: json["goals"],
        timeLine: json["time_line"],
        status: json["status"],
        idDoctor: json["id_doctor "],
        studentName: json["student_name"],
        universityId: json["university_id"],
        stdName1: json["std_name1"],
        stdName2: json["std_name2"],
        universityId1: json["university_id1"],
        universityId2: json["university_id2"],
        timeLine2: json["time_line2"],
        stdName4: json["std_name4"],
        stdId4: json["std_id4"],
        week1: json["week1"],
        task1: json["task1"],
        week2: json["week2"],
        task2: json["task2"],
        week3: json["week3"],
        task3: json["task3"],
        doctorName: json["doctor_name"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "goals": goals,
        "time_line": timeLine,
        "status": status,
        "id_doctor ": idDoctor,
        "student_name": studentName,
        "university_id": universityId,
        "std_name1": stdName1,
        "std_name2": stdName2,
        "university_id1": universityId1,
        "university_id2": universityId2,
        "time_line2": timeLine2,
        "std_name4": stdName4,
        "std_id4": stdId4,
        "week1": week1,
        "task1": task1,
        "week2": week2,
        "task2": task2,
        "week3": week3,
        "task3": task3,
        "doctor_name": doctorName,
        "note": note,
      };
}

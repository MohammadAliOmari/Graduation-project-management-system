
import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  List<User> users;

  StudentModel({
    required this.users,
  });
  factory StudentModel.empty() {
    return StudentModel(users: []);
  }
  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  String universityId;
  String name;

  User({
    required this.universityId,
    required this.name,
  });
  factory User.empty() {
    return User(name: "", universityId: "");
  }
  factory User.fromJson(Map<String, dynamic> json) => User(
        universityId: json["university_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "university_id": universityId,
        "name": name,
      };
}

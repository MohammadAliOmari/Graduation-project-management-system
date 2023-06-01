import 'dart:convert';

AllrequestProjects allrequestProjectsFromJson(String str) => AllrequestProjects.fromJson(json.decode(str));

String allrequestProjectsToJson(AllrequestProjects data) => json.encode(data.toJson());

class AllrequestProjects {
    List<Project> projects;

    AllrequestProjects({
        required this.projects,
    });

    factory AllrequestProjects.fromJson(Map<String, dynamic> json) => AllrequestProjects(
        projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
    };
}

class Project {
    String name;
    String studentName;
    String status;

    Project({
        required this.name,
        required this.studentName,
        required this.status,
    });

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json["name"],
        studentName: json["student_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "student_name": studentName,
        "status": status,
    };
}
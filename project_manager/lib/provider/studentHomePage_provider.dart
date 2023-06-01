import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:project_manager/model/users_model.dart';
import 'package:project_manager/shared/component/constant.dart';

class userProvider extends ChangeNotifier {
  StudentModel studentModel = StudentModel.empty();

  Future<StudentModel> getinfo(String university_id) async {
    final response = await http.post(
        Uri.parse("${ConsValues.BASEURL}homePage_student.php"),
        body: {"university_id": university_id});

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var users = jsonBody["users"];
      studentModel = StudentModel.fromJson(jsonBody);

      notifyListeners();
      return studentModel;
    } else {
      return StudentModel.empty();
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/users_model.dart';
import '../shared/component/constant.dart';

class AdminHomePageProvider extends ChangeNotifier {
  StudentModel adminProvider = StudentModel.empty();

  Future<StudentModel> getinfo(String universityid) async {
    final response = await http.post(
        Uri.parse("${ConsValues.baseUrl}admin_HomePage.php"),
        body: {"university_id": universityid});

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      // var users = jsonBody["users"];
      adminProvider = StudentModel.fromJson(jsonBody);

      notifyListeners();
      return adminProvider;
    } else {
      return StudentModel.empty();
    }
  }
}

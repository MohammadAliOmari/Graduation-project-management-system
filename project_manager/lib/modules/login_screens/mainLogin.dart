import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_manager/layout/project_manager_layout.dart';
import 'package:project_manager/layout/project_manager_layout_admin.dart';
import 'package:project_manager/modules/home_page_admin/home_page_admin.dart';
import 'package:project_manager/shared/component/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:project_manager/shared/sharedPreferences/generalSharedPreferences.dart';
import '../../shared/component/component.dart';
import '../home_page_doc/home_page_doc.dart';

class mainLogin extends StatefulWidget {
  const mainLogin({super.key});

  @override
  State<mainLogin> createState() => _mainLoginState();
}

class _mainLoginState extends State<mainLogin> {
  var emailControllor = TextEditingController();
  var passwordControllor = TextEditingController();
  var fkey = GlobalKey<FormState>();
  bool isPassShown = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: const Text(
          "AABU Project Manager",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: fkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defualtTextForm(
                      controller: emailControllor,
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
                      label: "University ID",
                      prefix: Icons.email),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                    controller: passwordControllor,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Password must not be empty";
                      }
                      return null;
                    },
                    label: "Password",
                    prefix: Icons.lock,
                    sufix:
                        isPassShown ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassShown,
                    sufixFun: () {
                      setState(() {
                        isPassShown = !isPassShown;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtButton(
                    text: "Login",
                    function: () {
                      if (fkey.currentState!.validate()) {
                        login();
                      }
                    },
                    // backGroundClolor: Colors.green,
                    radius: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  login() async {
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}logIn.php"),
      body: {
        "university_id": emailControllor.text,
        "pass": passwordControllor.text
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      if (jsonBody['result']) {
      await  General.savePrefString("university_id", jsonBody['university_id']);
       await General.savePrefString("pass", jsonBody['pass']);
        // General.savePrefString(ConsValues.name, jsonBody['name']);
        if (jsonBody['id_user_type'] == "1") {
          navigateTo(context, ProjectManagerLayoutAdmin());
        } else if (jsonBody['id_user_type'] == "2") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePageDoc();
              },
            ),
          );
        } else if (jsonBody['id_user_type'] == "3") {
          navigateTo(context, ProjectManagerLayout());
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.error),
              content: Text(jsonBody['msg']),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}

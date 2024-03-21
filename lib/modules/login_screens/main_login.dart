import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_manager/layout/project_manager_layout.dart';
import 'package:project_manager/layout/project_manager_layout_admin.dart';
import 'package:project_manager/shared/component/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:project_manager/shared/sharedPreferences/general_shared_preferences.dart';
import '../../shared/component/component.dart';
import '../home_page_doc/home_page_doc.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({super.key});

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
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
                  Center(
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo-wide.jpg'),
                        ),
                      ),
                    ),
                  ),
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

  Future login() async {
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.baseUrl}logIn.php"),
      body: {
        "university_id": emailControllor.text,
        "pass": passwordControllor.text
      },
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "Access-Control-Allow-Origin, Accept"
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      if (jsonBody['result']) {
        await General.savePrefString(
            "university_id", jsonBody['university_id']);
        await General.savePrefString("pass", jsonBody['pass']);
        // General.savePrefString(ConsValues.name, jsonBody['name']);
        if (!mounted) return;
        if (jsonBody['id_user_type'] == "1") {
          navigateTo(context, const ProjectManagerLayoutAdmin());
        } else if (jsonBody['id_user_type'] == "2") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePageDoc();
              },
            ),
          );
        } else if (jsonBody['id_user_type'] == "3") {
          navigateTo(context, const ProjectManagerLayout());
        }
      } else {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: const Icon(Icons.error),
              content: Text(jsonBody['msg']),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.error),
            content: const Text('erorr'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}

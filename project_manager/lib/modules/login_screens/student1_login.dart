import 'package:flutter/material.dart';

import '../../shared/component/component.dart';

class StudentLogin1 extends StatefulWidget {
  const StudentLogin1({super.key});

  @override
  State<StudentLogin1> createState() => _StudentLogin1State();
}

class _StudentLogin1State extends State<StudentLogin1> {
  var emailControllor = TextEditingController();
  var passwordControllor = TextEditingController();
  var fkey = GlobalKey<FormState>();
  bool isPassShown = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
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
                        // login();
                      }
                    },
                    // backGroundClolor: Colors.green,7
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

  // login() async {
  //   EasyLoading.show(status: 'loading...');
  //   final response = await http.post(
  //     Uri.parse("${ConsValues.BASEURL}login.php"),
  //     body: {
  //       "university_id": emailControllor.text,
  //       "pass": passwordControllor.text
  //     },
  //   );
  //   EasyLoading.dismiss();
  //   if (response.statusCode == 200) {
  //     var jsonBody = jsonDecode(response.body);
  //     if (jsonBody['result']) {
  //       General.savePrefString(
  //           ConsValues.university_id, jsonBody['university_id']);
  //       General.savePrefString(ConsValues.pass, jsonBody['pass']);
  //       // General.savePrefString(ConsValues.name, jsonBody['name']);

  //       if (jsonBody['id_user_type'] == "1") {
  //         navigateTo(context, ProjectManagerLayoutAdmin());
  //       } else if (jsonBody['id_user_type'] == "2") {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) {
  //               return ProjectManagerLayout();
  //             },
  //           ),
  //         );
  //       } else if (jsonBody['id_user_type'] == "3") {
  //         navigateTo(context, HomePageDoc());
  //       }
  //     } else {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             icon: Icon(Icons.error),
  //             content: Text(jsonBody['msg']),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text("OK"),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     }
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../shared/component/component.dart';
import '../../shared/component/constant.dart';
import 'package:http/http.dart' as http;

import 'add_more_students.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  addStd() async {
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}add_student.php"),
      body: {
        "university_id": idController.text,
        "name": studentName.text,
        "pass": passwordController.text,
      },
    );

    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: Icon(Icons.error),
            content: const Text("signUp failed email exsist"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("ok"),
              ),
            ],
          );
        },
      );
    }
  }

  var idController = TextEditingController();
  var passwordController = TextEditingController();
  var studentName = TextEditingController();
  var studentConfirmpasswordController = TextEditingController();
  var studentFormKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmStudentPassordShow = true;
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
          "AABU Project Manager",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: studentFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Student",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defualtTextForm(
                      //ID TextForm
                      controller: idController,
                      type: TextInputType.number,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "ID must not be empty";
                        }
                        if (value.length != 10) {
                          return "ID must be 10 numbers";
                        }

                        return null;
                      },
                      label: "University ID",
                      prefix: Icons.email),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                    //StudentName TextForm
                    controller: studentName,
                    type: TextInputType.name,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Student Name must not be empty!";
                      } else if (value.trim().length < 6) {
                        return "Student name must be at least 6 characters!";
                      } else if (value.trim().length > 20) {
                        return "Student name must be less than 20 characters!";
                      }
                      return null;
                    },
                    label: "Student name",
                    prefix: Icons.abc_outlined,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                    //Password
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Password must not be empty";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters!";
                      }
                      return null;
                    },
                    label: "Password",
                    prefix: Icons.lock,
                    sufix: isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    sufixFun: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                    //Confirm Password
                    controller: studentConfirmpasswordController,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Password must not be empty!";
                      }
                      if (studentConfirmpasswordController.text !=
                          passwordController.text) {
                        return "Passwords must be the same!";
                      }
                      return null;
                    },
                    label: "Re-enter password",
                    prefix: Icons.lock,
                    sufix: isConfirmStudentPassordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isPassword: isConfirmStudentPassordShow,
                    sufixFun: () {
                      setState(() {
                        isConfirmStudentPassordShow =
                            !isConfirmStudentPassordShow;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtButton(
                    text: "Add",
                    function: () {
                      if (studentFormKey.currentState!.validate()) {
                        addStd();
                      }
                    },
                    // backGroundClolor: Colors.green,
                    radius: 40.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtButton(
                    text: "Add more than 1 student",
                    function: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddMoreStudents(),
                            ));
                      });
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
}

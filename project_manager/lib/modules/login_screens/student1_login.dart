import 'package:flutter/material.dart';
import 'package:project_manager/layout/project_manager_layout_admin.dart';
import 'package:project_manager/modules/home_page_admin/home_page_admin.dart';

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
                        if (value.length != 11) {
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
                        navigateTo(context, const ProjectManagerLayoutAdmin());
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
}

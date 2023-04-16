import 'package:flutter/material.dart';
import 'package:project_manager/layout/project_manager_layout.dart';
import 'package:project_manager/modules/home_page/home_page.dart';
import 'package:project_manager/modules/login_screens/rigster.dart';
import 'package:project_manager/shared/component/constant.dart';

import '../../shared/component/component.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  var emailControllor = TextEditingController();
  var passwordControllor = TextEditingController();
  var fkey = GlobalKey<FormState>();
  bool isPassShown = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          "AABU Project Manager",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defualtTextForm(
                      controller: emailControllor,
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        String? email = value;
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email!);
                        if (value!.trim().isEmpty) {
                          return "Email must not be empty";
                        }
                        if (emailValid) {
                          return null;
                        } else {
                          return "Invalid Email";
                        }
                      },
                      label: "Email",
                      prefix: Icons.email),
                  const SizedBox(
                    height: 10.0,
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
                    height: 10.0,
                  ),
                  defualtButton(
                    text: "Login",
                    function: () {
                      if (fkey.currentState!.validate()) {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProjectManagerLayout(),
                              ));
                        });
                      }
                    },
                    backGroundClolor: mainColor,
                    radius: 40.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don\'t have an account?",
                        style: TextStyle(),
                      ),
                      const SizedBox(width: 10.0),
                      defualtButton(
                        text: "Rigster",
                        function: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RigsterScreen(),
                                ));
                          });
                        },
                        width: 150,
                        radius: 40.0,
                        backGroundClolor: mainColor,
                      )
                    ],
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

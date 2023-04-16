import 'package:flutter/material.dart';
import 'package:project_manager/modules/login_screens/student_login.dart';
import 'package:project_manager/shared/component/constant.dart';

import '../../shared/component/component.dart';

class RigsterScreen extends StatefulWidget {
  const RigsterScreen({super.key});

  @override
  State<RigsterScreen> createState() => _RigsterScreenState();
}

class _RigsterScreenState extends State<RigsterScreen> {
  var userNameController = TextEditingController();
  var rigsterEmailController = TextEditingController();
  var rigsterpasswordController = TextEditingController();
  var rigsterConfirmpasswordController = TextEditingController();
  var rigsterFormKey = GlobalKey<FormState>();
  bool isPassordRigsterShow = true;
  bool isConfirmPassordRigsterShow = true;
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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: rigsterFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign UP",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //user name
                  defualtTextForm(
                    controller: userNameController,
                    type: TextInputType.name,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "User Name must not be empty!";
                      } else if (value.trim().length < 6) {
                        return "User name must be at least 6 characters!";
                      } else if (value.trim().length > 20) {
                        return "User name must be less than 20 characters!";
                      }
                      return null;
                    },
                    label: "User Name",
                    prefix: Icons.person,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //email
                  defualtTextForm(
                      controller: rigsterEmailController,
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        String? email = value;
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email!);
                        if (value!.trim().isEmpty) {
                          return "Email must not be empty!";
                        }
                        if (emailValid) {
                          return null;
                        } else {
                          return "Invalid Email!";
                        }
                      },
                      label: "Email",
                      prefix: Icons.email),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //password
                  defualtTextForm(
                    controller: rigsterpasswordController,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Password must not be empty!";
                      }
                      return null;
                    },
                    label: "Password",
                    prefix: Icons.lock,
                    sufix: isPassordRigsterShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isPassword: isPassordRigsterShow,
                    sufixFun: () {
                      setState(() {
                        isPassordRigsterShow = !isPassordRigsterShow;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //confirm password
                  defualtTextForm(
                    controller: rigsterConfirmpasswordController,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Password must not be empty!";
                      }
                      if (rigsterConfirmpasswordController.text !=
                          rigsterpasswordController.text) {
                        return "Passwords must be the same!";
                      }
                      return null;
                    },
                    label: "Re-enter password",
                    prefix: Icons.lock,
                    sufix: isConfirmPassordRigsterShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isPassword: isConfirmPassordRigsterShow,
                    sufixFun: () {
                      setState(() {
                        isConfirmPassordRigsterShow =
                            !isConfirmPassordRigsterShow;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defualtButton(
                    text: "Sign Up",
                    function: () {
                      if (rigsterFormKey.currentState!.validate()) {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StudentLogin(),
                              ));
                        });
                      }
                    },
                    backGroundClolor: mainColor,
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

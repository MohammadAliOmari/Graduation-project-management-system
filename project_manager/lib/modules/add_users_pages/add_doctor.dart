import 'package:flutter/material.dart';

import '../../shared/component/component.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  var idController = TextEditingController();
  var passwordController = TextEditingController();
  var doctorName = TextEditingController();
  var doctorConfirmpasswordController = TextEditingController();
  var doctorFormKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmDoctorPassordShow = true;
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
              key: doctorFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Doctor",
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
                      //ID TextForm
                      controller: idController,
                      type: TextInputType.number,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "ID must not be empty";
                        }
                        if (value.length != 11) {
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
                    //DoctorName TextForm
                    controller: doctorName,
                    type: TextInputType.name,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Doctor Name must not be empty!";
                      } else if (value.trim().length < 6) {
                        return "Doctor name must be at least 6 characters!";
                      } else if (value.trim().length > 20) {
                        return "Doctor name must be less than 20 characters!";
                      }
                      return null;
                    },
                    label: "Doctor name",
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
                    controller: doctorConfirmpasswordController,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Password must not be empty!";
                      }
                      if (doctorConfirmpasswordController.text !=
                          passwordController.text) {
                        return "Passwords must be the same!";
                      }
                      return null;
                    },
                    label: "Re-enter password",
                    prefix: Icons.lock,
                    sufix: isConfirmDoctorPassordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isPassword: isConfirmDoctorPassordShow,
                    sufixFun: () {
                      setState(() {
                        isConfirmDoctorPassordShow =
                            !isConfirmDoctorPassordShow;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtButton(
                    text: "Add",
                    function: () {
                      if (doctorFormKey.currentState!.validate()) {}
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

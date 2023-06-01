import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import '../../shared/component/component.dart';
import '../../shared/component/constant.dart';

class AddMoreStudents extends StatefulWidget {
  const AddMoreStudents({super.key});

  @override
  State<AddMoreStudents> createState() => _AddMoreStudentsState();
}

class _AddMoreStudentsState extends State<AddMoreStudents> {
  var idController = TextEditingController();
  var idController2 = TextEditingController();
  var idController3 = TextEditingController();
  var idController4 = TextEditingController();
  var idController5 = TextEditingController();
  var idController6 = TextEditingController();

  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var passwordController3 = TextEditingController();
  var passwordController4 = TextEditingController();
  var passwordController5 = TextEditingController();
  var passwordController6 = TextEditingController();

  var studentName = TextEditingController();
  var studentName2 = TextEditingController();
  var studentName3 = TextEditingController();
  var studentName4 = TextEditingController();
  var studentName5 = TextEditingController();
  var studentName6 = TextEditingController();

  var studentFormKey = GlobalKey<FormState>();

  bool isPassword = true;
  bool isConfirmStudentPassordShow = true;
  addmorestd() async {
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}addMultiStd.php"),
      body: {
        "university_id": idController.text,
        "name": studentName.text,
        "pass": passwordController.text,
        "university_id1": idController2.text,
        "name1": studentName2.text,
        "pass1": passwordController2.text,
        "university_id2": idController3.text,
        "name2": studentName3.text,
        "pass2": passwordController3.text,
        "university_id3": idController4.text,
        "name3": studentName4.text,
        "pass3": passwordController4.text,
        "university_id4": idController5.text,
        "name4": studentName5.text,
        "pass4": passwordController5.text,
        "university_id5": idController6.text,
        "name5": studentName6.text,
        "pass5": passwordController6.text,
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
                  const Text(
                    "socond student",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      // color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                      //ID TextForm
                      controller: idController2,
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
                    controller: studentName2,
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
                    controller: passwordController2,
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
                  const Text(
                    "Third student",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      // color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                      //ID TextForm
                      controller: idController3,
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
                    controller: studentName3,
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
                    controller: passwordController3,
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
                  const Text(
                    "Fourth student",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      // color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                      //ID TextForm
                      controller: idController4,
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
                    controller: studentName4,
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
                    controller: passwordController4,
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
                  const Text(
                    "Fifth student",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      // color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                      //ID TextForm
                      controller: idController5,
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
                    controller: studentName5,
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
                    controller: passwordController5,
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
                  const Text(
                    "Sixth student",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      // color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defualtTextForm(
                      //ID TextForm
                      controller: idController6,
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
                    controller: studentName6,
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
                    controller: passwordController6,
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
                  defualtButton(
                    text: "Add",
                    function: () {
                      if (studentFormKey.currentState!.validate()) {
                        addmorestd();
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

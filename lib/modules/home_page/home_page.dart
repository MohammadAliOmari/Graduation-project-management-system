import 'package:flutter/material.dart';
import 'package:project_manager/model/users_model.dart';

import 'package:project_manager/shared/component/constant.dart';

import '../../provider/student_home_page_provider.dart';
import '../../shared/sharedPreferences/general_shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StudentModel studentModel = StudentModel.empty();
  @override
  void initState() {
    super.initState();
    get();
  }

  getInfo() async {
    studentModel =
        await UserProvider().getinfo(ConsValues.universityId).then((value) {
      setState(() {});
      return value;
    });
    setState(() {
      studentModel;
    });
  }

  get() async {
    ConsValues.name = await General.getPrefString("name", "").then((value) {
      setState(() {});
      return value;
    });

    ConsValues.universityId =
        await General.getPrefString("university_id", "").then((value) {
      return value;
    });
    setState(() {});
    await getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: studentModel.users.isNotEmpty
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/def_background.jpg'),
                  // fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo-wide.jpg'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    studentModel.users.first.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    studentModel.users.first.universityId,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_manager/modules/add_users_pages/add_doctor.dart';
import 'package:project_manager/modules/add_users_pages/add_student.dart';

import '../../model/users_model.dart';
import '../../provider/admin_home_page_provider.dart';
import '../../shared/component/component.dart';
import '../../shared/component/constant.dart';
import '../../shared/sharedPreferences/general_shared_preferences.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  StudentModel adminModel = StudentModel.empty();
  @override
  void initState() {
    super.initState();
    get();
  }

  getInfo() async {
    adminModel = await AdminHomePageProvider()
        .getinfo(ConsValues.universityId)
        .then((value) {
      setState(() {});
      return value;
    });
    setState(() {
      adminModel;
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
      body: adminModel.users.isNotEmpty
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/def_background.jpg'),
                  // fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      adminModel.users.first.name,
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
                                      adminModel.users.first.universityId,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defualtButton(
                          function: () {
                            navigateTo(
                              context,
                              const AddStudent(),
                            );
                          },
                          text: 'Add std',
                          radius: 40.0,
                          width: 150,
                          backGroundClolor: mainColor,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        defualtButton(
                          text: 'Add doc',
                          function: () {
                            navigateTo(
                              context,
                              const AddDoctor(),
                            );
                          },
                          width: 150,
                          radius: 40.0,
                          backGroundClolor: mainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

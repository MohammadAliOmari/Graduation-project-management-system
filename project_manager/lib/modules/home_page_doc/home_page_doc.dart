import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_manager/modules/all_request_pages_doc/all_request_page_doc.dart';
import 'package:project_manager/shared/component/component.dart';

import '../../model/users_model.dart';
import '../../provider/homePage_doctor_provider.dart';
import '../../shared/component/constant.dart';
import '../../shared/sharedPreferences/generalSharedPreferences.dart';
import '../login_screens/mainLogin.dart';

class HomePageDoc extends StatefulWidget {
  const HomePageDoc({super.key});

  @override
  State<HomePageDoc> createState() => _HomePageDocState();
}

class _HomePageDocState extends State<HomePageDoc> {
  StudentModel doctorModel = StudentModel.empty();
  @override
  void initState() {
    super.initState();
     get();
  }

  getInfo() async {
    doctorModel = await DoctorHomePageProvider().getinfo(ConsValues.university_id).then((value) {setState(() {
      
    });
            return value;

      } );
    setState(() {
      doctorModel;
    });
  }

  get() async {
  ConsValues.name=await  General.getPrefString("name", "").then((value) {
    setState(() {
      });
    return value;
      
    });

 ConsValues.university_id= await  General.getPrefString("university_id", "").then((value) {
      return value;
    });
    setState(() {
      });
    await getInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: const Icon(Icons.logout_sharp),
                      content: const Text("Are You Sure You Want To LogOut"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () async {
                            await General.remove(ConsValues.university_id);
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const mainLogin();
                                },
                              ),
                            );
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );

              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              )),
        ],
        title: const Text(
          'AABU Project Manager',
        ),
        automaticallyImplyLeading: false,
      ),
      body:doctorModel.users.isNotEmpty ?
       Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/def_background.jpg'),
            // fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          Text(
                            doctorModel.users.first.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            doctorModel.users.first.universityId,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: defualtButton(
                text: 'Request Information',
                isUpperCase: false,
                function: () {
                  navigateTo(context, const AllRequestPageDoc());
                },
                height: 50,
              ),
            ),
          ],
        ),
      )
      : const Center(child: CircularProgressIndicator()),
    );
  }
}

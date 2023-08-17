import 'package:flutter/material.dart';

import '../login_screens/dr_login.dart';
import '../login_screens/student_login.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isStudent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/def_background.jpg'),
            // fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),

        // appBar: AppBar(
        //   backgroundColor: Colors.green,
        // ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/images/logo-wide.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tell us",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                    const Text(
                      "Who you are",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isStudent = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StudentLogin(),
                                ));
                          });
                        },
                        onDoubleTap: () {},
                        child: Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: isStudent
                                ? const Color.fromARGB(123, 135, 135, 134)
                                : null,
                          ),
                          child: const Image(
                            image:
                                AssetImage("assets/images/students-logo.png"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isStudent = false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DoctorLogin(),
                                ));
                          });
                        },
                        onDoubleTap: () {},
                        child: Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: isStudent
                                ? null
                                : const Color.fromARGB(123, 135, 135, 134),
                          ),
                          child: const Image(
                            image: AssetImage("assets/images/teacher-logo.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

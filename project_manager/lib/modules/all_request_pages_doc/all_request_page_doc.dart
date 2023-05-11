// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_manager/shared/component/constant.dart';

import '../../shared/component/component.dart';

class AllRequestPageDoc extends StatefulWidget {
  const AllRequestPageDoc({super.key});

  @override
  State<AllRequestPageDoc> createState() => _AllRequestPageDocState();
}

class _AllRequestPageDocState extends State<AllRequestPageDoc> {
  bool allrequest = true;
  bool pending = false;
  bool approved = false;
  bool rejected = false;
  Color color1 = mainColor;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff01b397),
        title: const Center(
          child: Text(
            'All Request Page',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(color: mainColor, blurRadius: 25),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Colors.blueGrey, blurRadius: 25),
                          ],
                          color: color1,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              allrequest = true;
                              pending = false;
                              approved = false;
                              rejected = false;
                              color1 = mainColor;
                              color2 = Colors.grey;
                              color3 = Colors.grey;
                              color4 = Colors.grey;
                            });
                          },
                          child: const Text(
                            'All Request',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 25)
                          ],
                          color: color2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              allrequest = false;
                              pending = true;
                              approved = false;
                              rejected = false;
                              color1 = Colors.grey;
                              color2 = mainColor;
                              color3 = Colors.grey;
                              color4 = Colors.grey;
                            });
                          },
                          child: const Text(
                            'Pending',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 25)
                          ],
                          color: color3,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              allrequest = false;
                              pending = false;
                              approved = true;
                              rejected = false;
                              color1 = Colors.grey;
                              color2 = Colors.grey;
                              color3 = mainColor;
                              color4 = Colors.grey;
                            });
                          },
                          child: const Text(
                            'Approved',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 25)
                          ],
                          color: color4,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              allrequest = false;
                              pending = false;
                              approved = false;
                              rejected = true;
                              color1 = Colors.grey;
                              color2 = Colors.grey;
                              color3 = Colors.grey;
                              color4 = mainColor;
                            });
                          },
                          child: const Text(
                            'Rejected',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (allrequest)
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildRequestItem(
                          statues: 'Status', stcolor: Colors.blue),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: 15,
                    ),
                  ),
                if (pending)
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildRequestItem(
                          statues: 'Pending', stcolor: Colors.grey),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: 15,
                    ),
                  ),
                if (approved)
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildRequestItem(
                          statues: 'Approved', stcolor: Colors.green),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: 15,
                    ),
                  ),
                if (rejected)
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildRequestItem(
                          statues: 'Rejected', stcolor: Colors.red),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: 15,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

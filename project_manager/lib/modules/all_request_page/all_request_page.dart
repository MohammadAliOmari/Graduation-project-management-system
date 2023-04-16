import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_manager/shared/component/constant.dart';

import '../../shared/component/component.dart';

class AllRequestPage extends StatefulWidget {
  const AllRequestPage({super.key});

  @override
  State<AllRequestPage> createState() => _AllRequestPageState();
}

class _AllRequestPageState extends State<AllRequestPage> {
  bool _showList1 = true;
  bool _showList2 = false;
  bool _showList3 = false;
  Color color1 = mainColor;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
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
                              _showList1 = true;
                              _showList2 = false;
                              _showList3 = false;
                              color1 = mainColor;
                              color2 = Colors.grey;
                              color3 = Colors.grey;
                            });
                          },
                          child: const Text(
                            'Pending',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
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
                              _showList1 = false;
                              _showList2 = true;
                              _showList3 = false;
                              color2 = mainColor;
                              color1 = Colors.grey;
                              color3 = Colors.grey;
                            });
                          },
                          child: const Text(
                            'Approved',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
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
                              _showList1 = false;
                              _showList2 = false;
                              _showList3 = true;
                              color1 = Colors.grey;
                              color2 = Colors.grey;
                              color3 = mainColor;
                            });
                          },
                          child: const Text(
                            'Rejected',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_showList1)
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
                if (_showList2)
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
                if (_showList3)
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

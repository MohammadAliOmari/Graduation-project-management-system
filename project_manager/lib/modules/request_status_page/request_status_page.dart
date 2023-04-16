import 'package:flutter/material.dart';
import 'package:project_manager/shared/component/component.dart';
import 'package:project_manager/shared/component/constant.dart';

class RequestStatusPage extends StatefulWidget {
  const RequestStatusPage({super.key});

  @override
  State<RequestStatusPage> createState() => _RequestStatusPageState();
}

class _RequestStatusPageState extends State<RequestStatusPage> {
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
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(color: mainColor, blurRadius: 25),
              ],
            ),
            child: Column(children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildRequestItem(
                      statues: 'Pending', stcolor: Colors.grey),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 3,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

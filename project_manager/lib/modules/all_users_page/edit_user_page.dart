import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_manager/layout/project_manager_layout_admin.dart';
import 'package:project_manager/shared/component/component.dart';
import 'package:http/http.dart' as http;

import '../../shared/component/constant.dart';

class editUsers extends StatefulWidget {
  const editUsers({super.key, required this.index, required this.l1});
  final List l1;
  final int index;
  @override
  State<editUsers> createState() => _editUsersState();
}

TextEditingController name = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController id = TextEditingController();

class _editUsersState extends State<editUsers> {
  Future editData() async {
    var url = "${ConsValues.BASEURL}updateuser.php";

    await http.post(Uri.parse(url), body: {
      'university_id': id.text,
      'name': name.text,
      'pass': pass.text,
    });
    setState(() {
      if (widget.index != null) {
        id.text = widget.l1[widget.index]['university_id'];
        name.text = widget.l1[widget.index]['name'];
        pass.text = widget.l1[widget.index]['pass'];
      }
    });
  }

  get() async {
    await editData();
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Users',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          projectFormTextForm(
            //STUD ID1
            controller: id,
            type: TextInputType.text,
            validator: (value) {},
            label: "ID",
            prefix: Icons.numbers,
          ),
          SizedBox(
            height: 15.0,
          ),
          projectFormTextForm(
            //STUD ID1
            controller: name,
            type: TextInputType.text,
            validator: (value) {},
            label: "Name",
            prefix: Icons.abc_outlined,
          ),
          SizedBox(
            height: 15.0,
          ),
          projectFormTextForm(
            //STUD ID1
            controller: pass,
            type: TextInputType.text,
            validator: (value) {},
            label: "Password",
            prefix: Icons.lock,
          ),
          SizedBox(
            height: 15.0,
          ),
          defualtButton(
            text: 'Edit',
            function: () {
              editData();
              navigateTo(context, ProjectManagerLayoutAdmin());
            },
            radius: 40,
          ),
        ]),
      ),
    );
  }
}

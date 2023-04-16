import 'package:flutter/material.dart';

import '../../shared/component/component.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  var drId = TextEditingController();
  var fkey = GlobalKey<FormState>();
  bool isPasswordShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defualtTextForm(
                  controller: drId,
                  type: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Password must not be empty";
                    }
                    return null;
                  },
                  label: "Password",
                  prefix: Icons.lock,
                  sufix:
                      isPasswordShow ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPasswordShow,
                  sufixFun: () {
                    setState(() {
                      isPasswordShow = !isPasswordShow;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant.dart';

Widget defualtButton({
  double width = double.infinity,
  double height = 40,
  double radius = 0,
  Color backGroundClolor = mainColor,
  required String text,
  required VoidCallback function,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backGroundClolor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
Widget defualtTextForm({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validator,
  required String label,
  void Function(String)? onSubmit,
  void Function(String)? onChanged,
  void Function()? onTap,

  //icons
  required IconData prefix,
  IconData? sufix,
  VoidCallback? sufixFun,
  bool isRead = false,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      onChanged: onChanged,
      obscureText: isPassword,
      readOnly: isRead,
      decoration: InputDecoration(
        prefixIconColor: mainColor,
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: sufix != null
            ? IconButton(
                onPressed: sufixFun,
                icon: Icon(
                  sufix,
                ))
            : null,
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
Widget projectFormTextForm({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validator,
  required String label,
  String? hint,
  void Function(String)? onSubmit,
  void Function(String)? onChanged,
  void Function()? onTap,
  List<TextInputFormatter>? listInputFormatter,

  //icons
  required IconData prefix,
  IconData? sufix,
  VoidCallback? sufixFun,
  bool isRead = false,
  bool isPassword = false,
  int maxLine = 1,
  int? minLine,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      inputFormatters: listInputFormatter,
      validator: validator,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      onChanged: onChanged,
      obscureText: isPassword,
      readOnly: isRead,
      decoration: InputDecoration(
        prefixIconColor: mainColor,
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIconColor: mainColor,
        suffixIcon: sufix != null
            ? IconButton(
                onPressed: sufixFun,
                icon: Icon(
                  sufix,
                ))
            : null,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLine,
      minLines: minLine,
    );
Widget buildUserItem({
  required String name,
  required String id,
}) =>
    Row(
      children: [
        const Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage(
                ('assets/images/user.png'),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      id,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
Widget buildRequestItem({
  required String statues,
  required String projectName,
  required String studentName,
  required Color stcolor,
  required String time,
}) =>
    Row(
      children: [
        const Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage(
                ('assets/images/check-list.png'),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projectName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      studentName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        statues,
                        style: TextStyle(
                          color: stcolor,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(
                        vertical: 5,
                      )),
                      SizedBox(
                        width: 80,
                        child: Text(
                          time,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: mainColor,
      ),
    );

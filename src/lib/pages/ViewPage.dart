// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/AddTodo.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/widgets/uihelper.dart';

class ViewTask extends StatefulWidget {
  Map<String, dynamic> document;
  String id;
  ViewTask({super.key, required this.document, required this.id});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  TextEditingController? taskTitleController;
  TextEditingController? taskDescController;
  String type = "";
  // widget.document["task"];
  String category = "";
  @override
  void initstate() {
    super.initState();
    taskTitleController =
        TextEditingController(text: widget.document!["title"]);
    type = widget.document["task"];
    category = widget.document["category"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.black87
            //     gradient: LinearGradient(colors: [
            //   Color(0xffe1d1e26),
            //   Color(0xff252041),
            // ])
            ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.white,
                  size: 28,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "View",
                    style: TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  Text(
                    "Your Todo",
                    style: TextStyle(
                      fontSize: 33,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 2
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  label("Task Title"),
                  SizedBox(
                    height: 8,
                  ),
                  uihelper.CustomTextBox(widget.document["title"], context),
                  SizedBox(
                    height: 25,
                  ),
                  label("Task Type"),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      uihelper.typeSelect("Important",
                          type == "Important" ? 0xff89C9D3 : 0xff2664fa),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       type = "Important";
                      //     });
                      //   },
                      //   child: uihelper.typeSelect("Important",
                      //       type == "Important" ? 0xff89C9D3 : 0xff2664fa),
                      // ),
                      SizedBox(
                        width: 20,
                      ),
                      uihelper.typeSelect("Planned",
                          type == "Planned" ? 0xff89C9D3 : 0xff2bc8d9),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       type = "Planned";
                      //     });
                      //   },
                      //   child: uihelper.typeSelect("Planned",
                      //       type == "Planned" ? 0xff89C9D3 : 0xff2bc8d9),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  label("Description"),
                  SizedBox(
                    height: 12,
                  ),
                  uihelper.CustomTextBox(
                      widget.document["description"], context),
                  SizedBox(
                    height: 25,
                  ),
                  label("Category"),
                  SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    runSpacing: 10,
                    children: [
                      uihelper.categorySelect(
                          "Food", category == "Food" ? 0xff89C9D3 : 0xffff6d63),
                      SizedBox(
                        width: 20,
                      ),
                      uihelper.categorySelect("Workout",
                          category == "Workout" ? 0xff89C9D3 : 0xfff29732),
                      SizedBox(
                        width: 20,
                      ),
                      uihelper.categorySelect("Study",
                          category == "Study" ? 0xff89C9D3 : 0xff234ebd),
                      SizedBox(
                        width: 20,
                      ),
                      uihelper.categorySelect(
                          "Work", category == "Work" ? 0xff89C9D3 : 0xff6557ff),
                      SizedBox(
                        width: 20,
                      ),
                      uihelper.categorySelect("Shopping",
                          category == "Shopping" ? 0xff89C9D3 : 0xff2bc8d9),
                      SizedBox(
                        width: 20,
                      ),
                      uihelper.categorySelect("Others",
                          category == "Others" ? 0xff89C9D3 : 0xffff6d63),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  uihelper.CustomButtom1(() {}, "Edit Task", context),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Widget label(String label) {
  return Text(
    label,
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.5),
  );
}

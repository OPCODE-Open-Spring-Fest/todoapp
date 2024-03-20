import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/pages/ViewPage.dart';

class uihelper {
  static CustomButtom(VoidCallback voidCallback, String text, String icon,
      BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width - 22,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black,
            side: BorderSide(
              width: 1,
              color: Colors.grey,
            )),
        child: ListTile(
          leading: SvgPicture.asset(
            icon,
            height: 28,
            width: 28,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  static CustomTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide, BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width - 22,
      child: TextField(
          style: TextStyle(color: Colors.white),
          controller: controller,
          obscureText: toHide,
          decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(
                iconData,
                color: Colors.white,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey, width: 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey, width: 1)))),
    );
  }

  static CustomButtom1(
      VoidCallback voidCallback, String text, BuildContext context) {
    // List buttoncolor=[Color(0xff516395),Color(0xff614385),Color(0xff516395)];

    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 22,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 63, 99, 199),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }

  static CustomTextField1(
      TextEditingController controller, String text, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
        ),
        // height: 55,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            maxLines: null,
            style: TextStyle(
              color: Colors.white,
            ),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            )));
  }

  static typeSelect(String type, int color) {
    return Chip(
      backgroundColor: Color(color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(
        type,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
    );
  }

  static categorySelect(String type, int color) {
    return Chip(
      backgroundColor: Color(color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(
        type,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
    );
  }

  static todoCard(
    String title,
    IconData iconData,
    Color iconColor,
    IconData iconimp,
    bool check,
    Color iconBgColor,
    BuildContext context,
    Map<String, dynamic> document,
    String id,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                activeColor: Color(0xff6cf8a9),
                checkColor: Color(0xff0e3e26),
                value: check,
                onChanged: (value) {
                  FirebaseFirestore.instance
                      .collection("Todo")
                      .doc(id)
                      .delete()
                      .then((value) => null);
                },
              ),
            ),
            data: ThemeData(
              primarySwatch: Colors.blue,
              unselectedWidgetColor: Color(0xff5e616a),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewTask(
                              document: document,
                              id: id,
                            )));
              },
              child: Container(
                height: 75,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Color(0xff2a2e3d),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 33,
                        width: 36,
                        decoration: BoxDecoration(
                          color: iconBgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          iconData,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 20,
                              // letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          iconimp,
                          color: Colors.yellowAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  static CustomTextBox(String text, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
        ),
        // height: 55,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Text(
            text,
            // maxLines: null,
            style: TextStyle(
              color: Colors.white,
            ),

            // decoration: InputDecoration(
            // border: InputBorder.none,
            // hintText: text,
            // hintStyle: TextStyle(color: Colors.grey),
            // Padding:
            // EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          ),
        ));
  }
}

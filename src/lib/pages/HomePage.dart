import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:flutter/material.dart';
import 'package:todo_app/pages/AddTodo.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/widgets/uihelper.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("Todo").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: null,
        title: Text(
          "Today's Task",
          style: TextStyle(
              fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          StreamBuilder(
              stream: _stream,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> document = snapshot.data.docs[index]
                          .data() as Map<String, dynamic>;
                        
                      IconData iconData = Icons.access_alarms_outlined;
                      Color iconColor;
                      switch (document["category"]) {
                        case "Workout":
                          iconData = Icons.run_circle_outlined;
                          iconColor = Colors.white;
                          break;
                        case "Food":
                          iconData = Icons.food_bank_outlined;
                          iconColor = Colors.white;
                          break;
                        case "Work":
                          iconData = Icons.desk_outlined;
                          iconColor = Colors.white;
                          break;
                        case "Study":
                          iconData = Icons.book_online_outlined;
                          iconColor = Colors.white;
                          break;
                        case "Shopping":
                          iconData = Icons.local_grocery_store;
                          iconColor = Colors.white;
                          break;
                        case "Others":
                          iconData = Icons.alarm_add_outlined;
                          iconColor = Colors.white;
                          break;
                      }
                      IconData iconimp = Icons.star_border;

                      if (document["task"] == "Important") {
                        iconimp = Icons.star_outlined;
                      }
                      return uihelper.todoCard(
                        // "hello",
                          document["title"],
                          iconData,
                          Colors.black,
                          iconimp,
                          false,
                          Colors.white,
                          context,
                          document,
                          snapshot.data.docs[index].id,
                          );
                    });
              }),

          // SingleChildScrollView(
          //     child: Container(
          //   // color: Colors.red,
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: Column(
          //     children: [
          //       uihelper.todoCard("ashutosh", Icons.audiotrack, Colors.black,
          //           "111", false, Colors.white, context),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       uihelper.todoCard("ashutosh", Icons.audiotrack, Colors.black,
          //           "111", false, Colors.white, context),
          //       SizedBox(
          //         height: 10,
          //       )
          //     ],
          //   ),
          // )),
          Positioned(
            bottom: 30,
            right: 15,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTodoPage()));
              },
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Colors.indigoAccent, Colors.purple])),
                child: Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

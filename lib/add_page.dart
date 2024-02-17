import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

import 'user.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // List<User> users = [];

  // @override
  // void initState() async {
  //   super.initState();

  //   _fetchFirebaseData();
  // }

  // void _fetchFirebaseData() async {
  //   final db = FirebaseFirestore.instance;

  //   final event = await db.collection("users").get();
  //   final docs = event.docs;
  //   final users = docs.map((doc) => User.fromFirestore(doc)).toList();
    
  //   setState(() {
  //     this.users = users;
  //   });
  // }


  String first = '';
  String last = '';
  int born = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'First',
              ),
              onChanged: (text) {
                first = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'last',
              ),
              onChanged: (text) {
                last = text;
              },
            ),
            Row(
              children: [
                Text('born'),
                SizedBox(width: 10),
                Text(
                  '$born',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext cntext) {
                        return AlertDialog(
                          title: Text("Select Year"),
                          content: Container(
                            width: 300,
                            height: 300,
                            child: YearPicker(
                              firstDate: DateTime(DateTime.now().year - 100, 1),
                              lastDate: DateTime(DateTime.now().year + 100, 1),
                              selectedDate: DateTime(born),
                              onChanged: (DateTime dateTime) {
                                setState(() {
                                  born = dateTime.year;
                                });

                                Navigator.pop(context);
                              }
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text('選択'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                await _addToFirebase();
                Navigator.pop(context);
              },
              child: Text('追加する'),
            ),
          ],
        ),
      ),
    );
  }

  Future _addToFirebase() async {
    final db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": first,
      "last": last,
      "born": born,
    };

    // Add a new document with a generated ID
    await db.collection("users").add(user);
  }
}
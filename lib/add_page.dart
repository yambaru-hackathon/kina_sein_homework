import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

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
              decoration: const InputDecoration(
                hintText: 'First',
              ),
              onChanged: (text) {
                first = text;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'last',
              ),
              onChanged: (text) {
                last = text;
              },
            ),
            Row(
              children: [
                const Text('born'),
                const SizedBox(width: 10),
                Text(
                  '$born',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext cntext) {
                        return AlertDialog(
                          title: const Text("Select Year"),
                          content: SizedBox(
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
                  child: const Text('選択'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                await _addToFirebase();
                Navigator.pop(context);
              },
              child: const Text('追加する'),
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
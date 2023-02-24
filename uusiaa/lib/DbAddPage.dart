import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'DbListPage.dart';
import 'DrawerFile.dart';

class DbAddPage extends StatefulWidget {
  const DbAddPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DbAddPageState createState() => _DbAddPageState();
}

class _DbAddPageState extends State<DbAddPage> {
  late String _name;
  late String _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data to Database'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Add name and id to database',
                style: TextStyle(fontSize: 20.0)),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'ID'),
              onChanged: (value) {
                setState(() {
                  _id = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // ignore: deprecated_member_use
                final databaseReference = FirebaseDatabase.instance.reference();
                databaseReference.child('users').push().set({
                  'name': _name,
                  'id': _id,
                });
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

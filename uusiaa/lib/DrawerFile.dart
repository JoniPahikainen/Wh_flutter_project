import 'package:flutter/material.dart';
import 'package:uusiaa/DbAddPage.dart';
import 'package:uusiaa/MusicPage.dart';
import 'package:uusiaa/SettingsPage.dart';
import 'DbListPage.dart';
import 'HomePage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool homeSelected = false;
  bool musicSelected = false;
  bool dbAddSelected = false;
  bool settingsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // DrawerHeader(child: Text('Ahmer')),
          Container(
            height: 150.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/eka.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.music_video_rounded),
            title: const Text('Music Player'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MusicPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Db Add'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DbAddPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("Db List"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyDataPage()));
            },
          ),
          const Divider(thickness: 1.0),
          // switchListTile
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage()));
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Close'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

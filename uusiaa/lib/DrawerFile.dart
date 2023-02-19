import 'package:flutter/material.dart';
import 'NewPage.dart';
import 'HomePage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // DrawerHeader(child: Text('Ahmer')),
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/toka.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text('Ahmer Iqbal'),
            accountEmail: Text('ahmer5253@gmail.com'),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            // enabled: false,
            selected: false,
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text('New Page'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NextPage()));
            },
            // enabled: false,
            selected: true,
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contacts'),
            onTap: () {
              print('Pressed');
            },
            enabled: false,
            // selected: true,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification'),
            onTap: () {
              print('Pressed');
            },
            enabled: false,
            // selected: true,
          ),
          const Divider(thickness: 1.0),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Close'),
                onTap: () {
                  Navigator.of(context).pop();
                  print('Pressed');
                },
                // enabled: false,
                selected: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

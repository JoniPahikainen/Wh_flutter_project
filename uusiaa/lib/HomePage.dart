import 'package:flutter/material.dart';
import 'DrawerFile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Page'),
        backgroundColor: Color.fromARGB(255, 109, 201, 255),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: FlutterLogo(
          size: 150.0,
        ),
      ),
    );
  }
}

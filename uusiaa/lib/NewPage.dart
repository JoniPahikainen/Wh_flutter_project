import 'package:flutter/material.dart';
import 'DrawerFile.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Page'),
        backgroundColor: Color.fromARGB(255, 141, 54, 255),
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

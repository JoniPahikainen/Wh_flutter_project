import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'DrawerFile.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MusicPage(),
    ));

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                player.play(AssetSource('music.mp3'));
              },
              child: const Text('Play Audio'),
            ),
            ElevatedButton(
                onPressed: () {
                  player.stop();
                },
                child: const Text('Stop Audio')),
            ElevatedButton(
                onPressed: () {
                  player.pause();
                },
                child: const Text('Pause ')),
            ElevatedButton(
                onPressed: () {
                  player.resume();
                },
                child: const Text('Resume')),
          ],
        ),
      ),
    );
  }
}

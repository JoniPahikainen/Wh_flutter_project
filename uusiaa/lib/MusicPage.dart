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
  final String title = 'Music Player';

  @override
  // ignore: library_private_types_in_public_api
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300.0,
              width: 300.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/toka.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Prey",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("by Audiobinger", style: TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.play(AssetSource('AudiobingerPrey.mp3'));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    icon: const Icon(Icons.stop),
                    onPressed: () {
                      player.stop();
                    },
                  ),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                player.seek(position);
                player.resume();
              },
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position.inSeconds)),
                  Text(formatTime((duration - position).inSeconds)),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

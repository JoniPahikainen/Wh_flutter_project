import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:uusiaa/DrawerFile.dart';
import 'package:uusiaa/theme/theme_constants.dart';
import 'package:uusiaa/theme/theme_manager.dart';

import 'HomePage.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    ));

ThemeManager _themeManager = ThemeManager();

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SettingsPage> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  ThemeMode selectedThemeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
              child: Text('Change Theme',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedThemeMode = ThemeMode.light;
                  _themeManager.setThemeMode(selectedThemeMode);
                });
              },
              child: const Text(
                'Light Theme',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedThemeMode = ThemeMode.dark;
                    _themeManager.setThemeMode(selectedThemeMode);
                  });
                },
                child: const Text('Dark Theme'))
          ],
        ),
      ),
    );
  }
}

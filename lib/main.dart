import 'package:flutter/material.dart';
import 'package:soundboard/locator.dart';
import 'package:soundboard/src/views/pages/soundboard/soundboard.dart';

void main() async {
  await setupLocator();
  runApp(SoundboardApp());
}

class SoundboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundboard',
      home: Soundboard(),
    );
  }
}

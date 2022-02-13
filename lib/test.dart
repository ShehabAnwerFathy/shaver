import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'common/assets/sounds.dart';

///
class Test extends StatefulWidget {
  ///
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ///
  final audioPlayer = AudioPlayer()..setAsset(AppSounds.shaver);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Hello,World!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (audioPlayer.playing) {
            await audioPlayer.stop();
          } else {
            await audioPlayer.play();
          }
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<AudioPlayer>('audioPlayer', audioPlayer));
  }
}

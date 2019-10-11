import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  String _filePath;

  Stream<AudioPlayerState> get playerState => _audioPlayer.onPlayerStateChanged;

  void dispose() {
    _audioPlayer?.stop();
    _audioPlayer?.dispose();
  }

  void init(String filePath) {
    _filePath = filePath;
    _audioPlayer?.seek(Duration(milliseconds: 100));
  }

  Future<int> play() async {
    return await _audioPlayer?.play(_filePath, isLocal: true);
  }

  Future<int> pause() async {
    return await _audioPlayer?.pause();
  }

  Future<int> resume() async {
    return await _audioPlayer?.resume();
  }

  Future<int> stop() async {
    await _audioPlayer?.setReleaseMode(ReleaseMode.RELEASE);
    return await _audioPlayer?.stop();
  }

  Future<int> loop() async {
    await stop();
    await _audioPlayer?.setReleaseMode(ReleaseMode.LOOP);
    return play();
  }

  Future<int> setVolume(double volume) async {
    return await _audioPlayer?.setVolume(volume);
  }
}

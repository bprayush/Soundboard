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

  void init(String filePath) async {
    _filePath = filePath;
    await _audioPlayer?.seek(Duration(milliseconds: 500));
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
    await pause();
    await _audioPlayer?.seek(Duration(milliseconds: 500));
    return await _audioPlayer?.seek(Duration(milliseconds: 500));
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

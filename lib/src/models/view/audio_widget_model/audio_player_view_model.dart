import 'package:soundboard/locator.dart';
import 'package:soundboard/src/assets/enums_and_constants/audiostate.dart';
import 'package:soundboard/src/models/data/audio/audio_data_model.dart';
import 'package:soundboard/src/models/view/base_audio_view_model.dart';
import 'package:soundboard/src/services/audio/audio_player_service.dart';

class AudioPlayerViewModel extends BaseAudioViewModel {
  AudioDataModel _audioDataModel;
  AudioPlayerService _player = locator<AudioPlayerService>();

  double playerVolume = 0.5;

  void init(AudioDataModel audioDataModel) {
    _audioDataModel = audioDataModel;
    _player?.init(_audioDataModel.file);
    _player.playerState.stream.listen((onData) {
      print('PlayerState: $onData');
    });
    _player.setVolume(playerVolume);
  }

  void play() async {
    setState(AudioState.Playing);
    await _player?.play();
  }

  void pause() async {
    await _player?.pause();
    setState(AudioState.Paused);
  }

  void stop() async {
    await _player?.stop();
    setState(AudioState.Stopped);
  }

  void resume() async {
    await _player?.resume();
    setState(AudioState.Playing);
  }

  void loop() async {
    await _player?.loop();
    setState(AudioState.Looping);
  }

  void setVolume(double volume) async {
    playerVolume = volume;
    await _player?.setVolume(volume);
    setState(state);
  }

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }
}

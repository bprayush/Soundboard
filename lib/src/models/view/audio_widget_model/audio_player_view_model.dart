import 'package:soundboard/locator.dart';
import 'package:soundboard/src/assets/enums_and_constants/audiostate.dart';
import 'package:soundboard/src/models/data/audio/audio_data_model.dart';
import 'package:soundboard/src/models/view/base_audio_view_model.dart';
import 'package:soundboard/src/services/audio/audio_player_service.dart';

class AudioPayerViewModel extends BaseAudioViewModel {
  AudioDataModel _audioDataModel;
  AudioPlayerService _player = locator<AudioPlayerService>();

  void init(AudioDataModel audioDataModel) {
    _audioDataModel = audioDataModel;
    _player?.init(_audioDataModel.file);
    _player.playerState.stream.listen((onData) {
      print('PlayerState: $onData');
    });
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

  void loop() async {
    await _player?.loop();
    setState(AudioState.Looping);
  }

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }
}

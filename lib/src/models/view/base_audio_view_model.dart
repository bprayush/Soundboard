import 'package:flutter/foundation.dart';
import 'package:soundboard/src/assets/enums_and_constants/audiostate.dart';

class BaseAudioViewModel extends ChangeNotifier {
  AudioState _state = AudioState.Stopped;

  AudioState get state => _state;

  void setState(AudioState state) {
    _state = state;
    notifyListeners();
  }
}

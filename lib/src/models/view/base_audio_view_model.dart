import 'package:flutter/foundation.dart';
import 'package:soundboard/src/assets/enums_and_constants/audiostate.dart';

class BaseAudioViewModel extends ChangeNotifier {
  AudioState _state = AudioState.Stopped;
  AudioState _previousState = AudioState.Stopped;

  AudioState get state => _state;
  AudioState get previousState => _previousState;

  void setState(AudioState state) {
    _previousState = _state;
    _state = state;
    // print('State: $_state');
    // print('Previous State: $_previousState');
    notifyListeners();
  }
}

import 'dart:io';

import 'package:soundboard/locator.dart';
import 'package:soundboard/src/assets/enums_and_constants/viewstate.dart';
import 'package:soundboard/src/models/data/audio/audio_data_model.dart';
import 'package:soundboard/src/models/view/base_view_model.dart';
import 'package:soundboard/src/services/audio/file_service.dart';

class AudioListViewModel extends BaseViewModel {
  List<AudioDataModel> _audioList;
  List<AudioDataModel> get audioList => _audioList;
  final FileFetchService _fileFetchService = locator<FileFetchService>();

  AudioListViewModel() {
    _audioList = List<AudioDataModel>();
  }

  Future<void> getAudioFile() async {
    setState(ViewState.Busy);
    File file = await _fileFetchService.fetchAudioFile();
    if (file != null) _updateList(file.path);
    setState(ViewState.Idle);
  }

  void _updateList(String path) {
    String title = path.substring(
      path.lastIndexOf('/') + 1,
      path.lastIndexOf('.'),
    );
    // print('Title: $title');
    // print('Path: $path');

    _audioList.add(AudioDataModel(
      file: path,
      title: title,
    ));
  }
}

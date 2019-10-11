import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FileFetchService {
  String errorMessage;

  Future<File> fetchAudioFile() async {
    File audioFile;
    try {
      audioFile = await FilePicker.getFile(type: FileType.AUDIO);
    } catch (_) {
      errorMessage = _.toString();
      print(_);
    }

    return audioFile;
  }
}

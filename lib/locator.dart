import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:soundboard/src/services/audio/file_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<FileFetchService>(() => FileFetchService());
  locator.registerFactory<AudioPlayer>(() => AudioPlayer());
}

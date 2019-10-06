import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soundboard/locator.dart';
import 'package:soundboard/src/assets/enums_and_constants/audiostate.dart';
import 'package:soundboard/src/assets/enums_and_constants/colors.dart';
import 'package:soundboard/src/models/data/audio/audio_data_model.dart';
import 'package:soundboard/src/models/view/audio_widget_model/audio_player_view_model.dart';
import 'package:soundboard/src/views/widgets/card_widget/card_widget.dart';

class AudioWidget extends StatefulWidget {
  final AudioDataModel audioFile;

  const AudioWidget({Key key, @required this.audioFile}) : super(key: key);

  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  final AudioPlayerViewModel _audioPlayerViewModel =
      locator<AudioPlayerViewModel>();

  @override
  void initState() {
    _audioPlayerViewModel?.init(widget.audioFile);
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayerViewModel?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<AudioPlayerViewModel>(
      builder: (context) => _audioPlayerViewModel,
      child: CardWidget(
        color: AppColors.DARK_PURPLE,
        width: width * 0.45,
        height: width * 0.45,
        margin: EdgeInsets.all(
          width * 0.02,
        ),
        padding: EdgeInsets.all(
          width * 0.02,
        ),
        child: Consumer<AudioPlayerViewModel>(
          builder: (_, model, __) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${widget.audioFile.title}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              if (model.state == AudioState.Stopped)
                                model.play();
                              else if (model.state == AudioState.Playing)
                                model.pause();
                              else if (model.state == AudioState.Paused)
                                model.resume();
                              else if (model.state == AudioState.Looping)
                                model.stop();
                            },
                            onLongPress: () {
                              model.loop();
                            },
                            child: model.state == AudioState.Looping
                                ? Theme(
                                    data: ThemeData(
                                      accentColor: Colors.white,
                                    ),
                                    child: CircularProgressIndicator(),
                                  )
                                : Icon(
                                    model.state == AudioState.Stopped
                                        ? FontAwesomeIcons.play
                                        : model.state == AudioState.Playing
                                            ? FontAwesomeIcons.pause
                                            : FontAwesomeIcons
                                                .play, //play, pause, stop
                                    color: Colors.white,
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              model.stop();
                            },
                            child: Icon(
                              FontAwesomeIcons.stop, //play, pause, stop
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Theme(
                  data: ThemeData(
                    sliderTheme: SliderThemeData(
                      activeTickMarkColor: Colors.white,
                      thumbColor: Colors.white,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: AppColors.GREYISH_BLACK,
                    ),
                  ),
                  child: Center(
                    child: Slider(
                      onChanged: (value) {
                        model.setVolume(value);
                      },
                      min: 0.0,
                      max: 1.0,
                      value: model.playerVolume,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

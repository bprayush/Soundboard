import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soundboard/src/assets/enums_and_constants/colors.dart';
import 'package:soundboard/src/models/data/audio/audio_data_model.dart';
import 'package:soundboard/src/views/widgets/card_widget/card_widget.dart';

class AudioWidget extends StatefulWidget {
  final AudioDataModel audioFile;

  const AudioWidget({Key key, @required this.audioFile}) : super(key: key);

  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return CardWidget(
      color: AppColors.DARK_PURPLE,
      width: width * 0.45,
      height: width * 0.45,
      margin: EdgeInsets.all(
        width * 0.02,
      ),
      padding: EdgeInsets.all(
        width * 0.02,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.play, //play, pause, stop
                        color: Colors.white,
                      ),
                      Icon(
                        FontAwesomeIcons.stop, //play, pause, stop
                        color: Colors.white,
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
                  onChanged: (value) {},
                  min: 0.0,
                  max: 100.0,
                  value: 50.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

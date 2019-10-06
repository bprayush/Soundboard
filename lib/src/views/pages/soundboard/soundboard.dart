import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soundboard/src/assets/enums_and_constants/colors.dart';
import 'package:soundboard/src/assets/utils/breakpoint_detector.dart';
import 'package:soundboard/src/views/widgets/add_widget/add_widget.dart';
import 'package:soundboard/src/views/widgets/card_widget/card_widget.dart';

class Soundboard extends StatefulWidget {
  @override
  _SoundboardState createState() => _SoundboardState();
}

class _SoundboardState extends State<Soundboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            print(constraints.maxWidth);
            return GridView.builder(
              padding: EdgeInsets.only(
                top: width * 0.05,
                left: width * 0.05,
                right: width * 0.05,
                bottom: width * 0.05,
              ),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isSmall(width) ? 2 : isMedium(width) ? 4 : 8,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return CardWidget(
                  color: AppColors.DARK_PURPLE,
                  width: width * 0.45,
                  height: width * 0.45,
                  margin: EdgeInsets.all(
                    width * 0.02,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
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
              },
            );
          },
        ),
      ),
    );
  }
}

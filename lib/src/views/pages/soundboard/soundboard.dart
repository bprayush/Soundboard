import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundboard/locator.dart';
import 'package:soundboard/src/assets/utils/breakpoint_detector.dart';
import 'package:soundboard/src/models/view/audio_list_model/audio_list_model.dart';
import 'package:soundboard/src/views/widgets/add_widget/add_widget.dart';
import 'package:soundboard/src/views/widgets/audio_widget/audio_widget.dart';

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
        body: ChangeNotifierProvider<AudioListViewModel>(
          builder: (context) => locator<AudioListViewModel>(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;
              print(constraints.maxWidth);
              return Consumer<AudioListViewModel>(
                builder: (_, audioListViewModel, __) => GridView.builder(
                  padding: EdgeInsets.only(
                    top: width * 0.05,
                    left: width * 0.05,
                    right: width * 0.05,
                    bottom: width * 0.05,
                  ),
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        isSmall(width) ? 2 : isMedium(width) ? 4 : 8,
                  ),
                  itemCount: audioListViewModel.audioList.length + 1,
                  itemBuilder: (context, index) {
                    if (index != audioListViewModel.audioList.length) {
                      return AudioWidget(
                        audioFile: audioListViewModel.audioList[index],
                      );
                    } else {
                      return AddWidget(
                        onTap: () {
                          audioListViewModel.getAudioFile();
                        },
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

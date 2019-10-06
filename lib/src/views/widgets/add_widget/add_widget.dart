import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soundboard/src/assets/enums_and_constants/colors.dart';
import 'package:soundboard/src/views/widgets/card_widget/card_widget.dart';

class AddWidget extends StatelessWidget {
  final Function onTap;

  const AddWidget({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: CardWidget(
        width: width * 0.45,
        height: width * 0.45,
        margin: EdgeInsets.all(
          width * 0.02,
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.plusCircle,
            color: AppColors.GREYISH_BLACK,
          ),
        ),
      ),
    );
  }
}

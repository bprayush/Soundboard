import 'package:flutter/material.dart';
import 'package:soundboard/src/assets/box_shadow/box_shadow.dart';

class CardWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;

  const CardWidget({
    Key key,
    @required this.width,
    @required this.height,
    this.margin,
    this.padding,
    this.child,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          shadow,
        ],
      ),
      child: child,
    );
  }
}

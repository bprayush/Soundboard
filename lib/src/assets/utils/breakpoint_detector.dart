import 'package:soundboard/src/assets/enums_and_constants/viewbreaks.dart';

bool isSmall(double width) {
  if (width <= ViewBreaks.SMALL['max'] && width >= ViewBreaks.SMALL['min'])
    return true;
  return false;
}

bool isMedium(double width) {
  if (width <= ViewBreaks.MEDIUM['max'] && width >= ViewBreaks.MEDIUM['min'])
    return true;
  return false;
}

bool isLarge(double width) {
  if (width <= ViewBreaks.LARGE['max'] && width >= ViewBreaks.LARGE['min'])
    return true;
  return false;
}

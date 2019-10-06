import 'package:flutter/foundation.dart';
import 'package:soundboard/src/assets/enums_and_constants/viewstate.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}

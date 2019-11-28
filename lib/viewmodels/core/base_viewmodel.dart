import 'package:flutter/material.dart';
import 'package:google_lens_clone/enums/viewstate.dart';

class BaseViewModel extends ChangeNotifier {

  bool _dispose = false;
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    if(_dispose == false)
        notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _dispose = true;
  }
}
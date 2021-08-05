import 'package:flutter/material.dart';

enum GroseryState { normal, detail }

class HomeProvider with ChangeNotifier {
  AnimationController _animationController;
  GroseryState _stateGrosery = GroseryState.normal;

  AnimationController get animationController => _animationController;

  set animationController(AnimationController animationController) {
    _animationController = animationController;
    notifyListeners();
  }

  GroseryState get stateGrosery => _stateGrosery;

  set stateGrosery(GroseryState stateGrosery) {
    _stateGrosery = stateGrosery;
    notifyListeners();
  }

  void init(AnimationController controller) {
    _animationController = controller;
  }

  void changeStateDetail() {
    stateGrosery = GroseryState.detail;
  }

  void changeStateNormal() {
    stateGrosery = GroseryState.normal;
  }
}

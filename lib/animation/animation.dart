import 'package:flutter/cupertino.dart';

class AnimationPysicalContainer extends ChangeNotifier {
  bool isFlat = true;
  void animationPysicalWidget() {
    isFlat = !isFlat;
    notifyListeners();
  }
}

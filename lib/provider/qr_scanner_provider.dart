import 'package:flutter/foundation.dart';

class QrScannerProvider with ChangeNotifier {

  bool _flashActivated = false;
  bool get flashActivated => _flashActivated;

  bool _frontCamera = false;
  bool get frontCamera => _frontCamera;

  void onClickFlash(value) {
    _flashActivated = value;
    notifyListeners();
  }

  void onClickFrontCamera(value) {
    _frontCamera = value;
    notifyListeners();
  }

}
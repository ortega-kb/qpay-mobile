import 'package:flutter/foundation.dart';

class QrScannerProvider with ChangeNotifier {

  bool _flashActivated = false;
  bool get flashActivated => _flashActivated;


  void onClickFlash(value) {
    _flashActivated = value;
    notifyListeners();
  }

}
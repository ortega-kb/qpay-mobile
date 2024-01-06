import 'package:flutter/foundation.dart';

class RegisterStepProvider with ChangeNotifier {

  int _currentStep = 0;
  int get currentStep => _currentStep;

  void stepContinue() {
    if (currentStep < 4) {
      _currentStep ++;
      notifyListeners();
    }
  }

  void stepCancel() {
    if (currentStep > 0) {
      _currentStep --;
      notifyListeners();
    }
  }

}
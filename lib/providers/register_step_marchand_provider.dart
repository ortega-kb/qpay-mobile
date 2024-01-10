import 'package:flutter/foundation.dart';

class RegisterStepMarchandProvider with ChangeNotifier {

  int _currentStep = 0;
  int get currentStep => _currentStep;

  void stepContinue() {
    if (currentStep < 2) {
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
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class TimerOtpCubit extends Cubit<int> {
  Timer? _timer;
  static const int _initialTime = 60;

  TimerOtpCubit() : super(_initialTime);

  void startTimer() {
    _timer?.cancel();
    emit(_initialTime);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        emit(state - 1);
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    emit(_initialTime);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

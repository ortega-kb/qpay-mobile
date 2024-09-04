import 'package:flutter_bloc/flutter_bloc.dart';


class TimeReportCubit extends Cubit<int> {
  TimeReportCubit() : super(0);

  void onChangeTime(int time) {
    emit(time);
  }
}

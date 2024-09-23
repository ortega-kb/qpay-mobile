import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationCubit extends Cubit<int> {
  HomeNavigationCubit() : super(0);

  navigate(int currentIndex) => emit(currentIndex);

}

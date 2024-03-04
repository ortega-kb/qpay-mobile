import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageIndicatorProvider = StateNotifierProvider<PageIndicatorNotifier, int>(
    (ref) => PageIndicatorNotifier());

class PageIndicatorNotifier extends StateNotifier<int> {
  PageIndicatorNotifier() : super(0);

  void setPage(int value) {
    state = value;
  }
}

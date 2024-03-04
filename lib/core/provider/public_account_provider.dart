import 'package:flutter_riverpod/flutter_riverpod.dart';

final publicAccountPagerProvider =
    StateNotifierProvider<PublicAccountPagerNotifier, int>(
        (ref) => PublicAccountPagerNotifier());

class PublicAccountPagerNotifier extends StateNotifier<int> {
  PublicAccountPagerNotifier() : super(0);

  void setPage(int value) {
    state = value;
  }
}

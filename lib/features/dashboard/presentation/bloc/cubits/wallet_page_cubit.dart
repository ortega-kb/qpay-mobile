import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPageCubit extends Cubit<int> {
  WalletPageCubit(): super(0);

  void onChangePage(int page) {
    debugPrint('Current page wallet: $page');
    emit(page);
  }
  
}
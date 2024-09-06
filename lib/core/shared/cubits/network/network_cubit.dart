import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  NetworkCubit() : super(NetworkInitial()) {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      bool isConnected = result.first != ConnectivityResult.none;
      _updateConnectivityStatus(isConnected);
    });
  }

  // Update connectivity status based on current connectivity state
  void _updateConnectivityStatus(bool isConnected) {
    if (isConnected) emit(NetworkConnected());
    else emit(NetworkDisconnected());
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}

part of 'network_cubit.dart';

sealed class NetworkState extends Equatable {
  const NetworkState();
}

final class NetworkInitial extends NetworkState {
  @override
  List<Object> get props => [];
}

final class NetworkConnected extends NetworkState {
  @override
  List<Object> get props => [];
}

final class NetworkDisconnected extends NetworkState {
  @override
  List<Object> get props => [];
}
import 'package:flutter_bloc/flutter_bloc.dart';


class WalletShowHideCubit extends Cubit<bool> {
  WalletShowHideCubit() : super(false);
  void toggleWalletVisibility() => emit(!state);
}

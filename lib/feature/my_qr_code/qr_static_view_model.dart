import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/domain/entity/qr_static.dart';
import 'package:qpay/core/domain/repository/qr_static_repository.dart';
import 'package:qpay/core/provider/qr_static_provider.dart';
import 'package:qpay/feature/my_qr_code/qr_static_state.dart';

final qrStaticViewModelProvider =
    StateNotifierProvider<QRStaticViewModel, QRStaticState>(
  (ref) {
    return QRStaticViewModel(
      ref.watch(qrStaticRepositoryProvider),
    );
  },
);

class QRStaticViewModel extends StateNotifier<QRStaticState> {
  QRStaticViewModel(this._qrStaticRepository) : super(QRStaticState()) {
    getAllQRStatic();
  }

  final QRStaticRepository _qrStaticRepository;

  getAllQRStatic() async {
    state = state.copyWith(isLoading: true);
    final qrStaticList = await _qrStaticRepository.getAllQRStatic();
    state = state.copyWith(qrStatic: qrStaticList, isLoading: false);
  }

  Future<void> addQRStatic(QRStatic qrStatic) async {
    await _qrStaticRepository.addQRStatic(qrStatic);
  }

  Future<void> deleteQRStatic(int index) async {
    await _qrStaticRepository.deleteQRStatic(index);
  }
}

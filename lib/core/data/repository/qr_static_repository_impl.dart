import 'package:qpay/core/domain/entity/qr_static.dart';
import 'package:qpay/core/domain/model/qr_static_model.dart';
import 'package:qpay/core/domain/repository/qr_static_repository.dart';
import 'package:qpay/core/local/local_qr_static.dart';

class QRStaticRepositoryImpl implements QRStaticRepository {
  final LocalQRStatic _qrStatic;

  QRStaticRepositoryImpl(this._qrStatic);

  @override
  Future<void> addQRStatic(QRStatic qrStatic) async {
    final qrStaticModel = QRStaticModel.fromEntity(qrStatic);
    _qrStatic.addQRStatic(qrStaticModel);
  }

  @override
  Future<void> deleteQRStatic(int index) async {
    _qrStatic.deleteQRStatic(index);
  }

  @override
  Future<List<QRStatic>> getAllQRStatic() async {
    final qrStaticModels = _qrStatic.getAllQRStatic();
    return qrStaticModels.map((e) => e.toEntity()).toList();
  }
}

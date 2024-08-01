import 'package:hive_flutter/adapters.dart';
import 'package:qpay/core/errors/exception.dart';
import 'package:qpay/features/qr_code/data/models/qr_static_model.dart';

abstract interface class QrStaticLocalDatasource {
  Future<List<QRStaticModel>> getAllQRCode();
  Future<void> addQRStatic(QRStaticModel qrStaticModel);
  Future<void> deleteQRStatic(int index);
}

class QRStaticLocalDatasourceImpl implements QrStaticLocalDatasource {
  final Box<QRStaticModel> qrStaticBox;
  const QRStaticLocalDatasourceImpl(this.qrStaticBox);


  @override
  Future<void> addQRStatic(QRStaticModel qrStaticModel) async {
    try {
      await qrStaticBox.add(qrStaticModel);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteQRStatic(int index) async {
    try {
      await qrStaticBox.deleteAt(index);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<QRStaticModel>> getAllQRCode() async {
    try {
      return qrStaticBox.values.toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

}
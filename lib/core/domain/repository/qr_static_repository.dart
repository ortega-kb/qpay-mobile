import '../../local/qr_static.dart';

abstract class QRStaticRepository {
  Future<List<QRStatic>> getAllQRStatic();
  Future<void> addQRStatic(QRStatic qrStatic);
  Future<void> deleteQRStatic(int index);
}

import 'package:hive/hive.dart';

import '../domain/model/qr_static_model.dart';

class LocalQRStatic {
  LocalQRStatic(this._qrStaticBox);
  final Box<QRStaticModel> _qrStaticBox;

  List<QRStaticModel> getAllQRStatic() {
    return _qrStaticBox.values.toList();
  }

  addQRStatic(QRStaticModel qrStaticModel) {
    _qrStaticBox.add(qrStaticModel);
  }

  deleteQRStatic(int index) {
    _qrStaticBox.deleteAt(index);
  }
}

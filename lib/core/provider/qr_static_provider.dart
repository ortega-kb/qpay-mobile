import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:qpay/core/data/repository/qr_static_repository_impl.dart';
import 'package:qpay/core/domain/model/qr_static_model.dart';
import 'package:qpay/core/domain/repository/qr_static_repository.dart';
import 'package:qpay/core/local/local_qr_static.dart';

final localQRStaticProvider = Provider((ref) {
  final Box<QRStaticModel> qrStaticBox = Hive.box("qr_static");
  return LocalQRStatic(qrStaticBox);
});

final qrStaticRepositoryProvider = Provider<QRStaticRepository>(
  (ref) => QRStaticRepositoryImpl(
    ref.watch(localQRStaticProvider),
  ),
);

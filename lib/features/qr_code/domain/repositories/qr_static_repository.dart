import 'package:fpdart/fpdart.dart';
import 'package:qpay/features/qr_code/domain/entities/qr_static.dart';

import '../../../../core/errors/failure.dart';

abstract interface class QRStaticRepository {
  Future<Either<Failure, List<QRStatic>>> getAllQRStatic();
  Future<Either<Failure, void>> addQRStatic(QRStatic qrStatic);
  Future<Either<Failure, void>> deleteQRStatic(int index);
}
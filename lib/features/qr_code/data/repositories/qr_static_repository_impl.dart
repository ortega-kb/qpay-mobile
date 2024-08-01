import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/features/qr_code/data/datasources/qr_static_local_datasource.dart';
import 'package:qpay/features/qr_code/data/models/qr_static_model.dart';
import 'package:qpay/features/qr_code/domain/entities/qr_static.dart';
import 'package:qpay/features/qr_code/domain/repositories/qr_static_repository.dart';

import '../../../../core/errors/exception.dart';

class QRStaticRepositoryImpl implements QRStaticRepository {
  final QrStaticLocalDatasource qrStaticLocalDatasource;

  QRStaticRepositoryImpl(this.qrStaticLocalDatasource);

  @override
  Future<Either<Failure, void>> addQRStatic(QRStatic qrStatic) async {
    try {
      return right(
        await qrStaticLocalDatasource.addQRStatic(
          QRStaticModel.fromEntity(qrStatic),
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteQRStatic(int index) async {
    try {
      return right(await qrStaticLocalDatasource.deleteQRStatic(index));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<QRStatic>>> getAllQRStatic() async {
    try {
      return right(await qrStaticLocalDatasource.getAllQRCode());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

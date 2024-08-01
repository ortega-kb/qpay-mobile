import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/qr_code/domain/entities/qr_static.dart';
import 'package:qpay/features/qr_code/domain/repositories/qr_static_repository.dart';

class GetQRStatic implements UseCase<List<QRStatic>, NoParams> {
  final QRStaticRepository qrStaticRepository;
  GetQRStatic(this.qrStaticRepository);

  @override
  Future<Either<Failure, List<QRStatic>>> invoke(NoParams params) {
    return qrStaticRepository.getAllQRStatic();
  }

}
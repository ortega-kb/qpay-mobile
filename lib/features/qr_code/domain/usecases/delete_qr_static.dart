import 'package:fpdart/src/either.dart';

import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/features/qr_code/domain/repositories/qr_static_repository.dart';

import '../../../../core/utils/usecase.dart';

class DeleteQRStatic implements UseCase<void, DeleteQRStaticParams> {
  final QRStaticRepository qrStaticRepository;
  DeleteQRStatic(this.qrStaticRepository);

  @override
  Future<Either<Failure, void>> invoke(DeleteQRStaticParams params) {
    return qrStaticRepository.deleteQRStatic(params.index);
  }

}

class DeleteQRStaticParams {
  final int index;
  DeleteQRStaticParams({required this.index});
}
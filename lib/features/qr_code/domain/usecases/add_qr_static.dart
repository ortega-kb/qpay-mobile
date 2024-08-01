import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/qr_code/domain/entities/qr_static.dart';
import 'package:qpay/features/qr_code/domain/repositories/qr_static_repository.dart';

class AddQRStatic implements UseCase<void, AddQRStaticParams> {
  final QRStaticRepository qrStaticRepository;

  AddQRStatic(this.qrStaticRepository);

  @override
  Future<Either<Failure, void>> invoke(AddQRStaticParams params) {
    return qrStaticRepository.addQRStatic(
      QRStatic(
        account: params.account,
        amount: params.amount,
        motif: params.motif,
        currency: params.currency,
      ),
    );
  }
}

class AddQRStaticParams {
  final String account;
  final double amount;
  final String motif;
  final String currency;

  AddQRStaticParams({
    required this.account,
    required this.amount,
    required this.motif,
    required this.currency,
  });
}

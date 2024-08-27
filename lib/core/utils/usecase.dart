import 'package:fpdart/fpdart.dart';
import 'package:qpay/core/errors/failure.dart';

/// Define a generic use case
/// [S] The type of success data returned by use case
/// [P] The type of params required by use case
abstract interface class UseCase<S, P> {
  Future<Either<Failure, S>> call(P params);
}


class NoParams {}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_state.freezed.dart';

@freezed
abstract class VerificationState with _$VerificationState {
  const factory VerificationState.initial() = Initial;
  const factory VerificationState.loading() = Loading;
  const factory VerificationState.error(String e) = Error;
  const factory VerificationState.success() = Success;
}

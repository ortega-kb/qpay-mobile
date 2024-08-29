part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object> get props => [];
}

final class AuthSignUpErrorState extends AuthState {
  final String errorMessage;
  const AuthSignUpErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class AuthSignInErrorState extends AuthState {
  final String errorMessage;
  const AuthSignInErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class AuthSignInSuccessState extends AuthState {
  final User user;
  const AuthSignInSuccessState(this.user);

  @override
  List<Object> get props => [];
}

final class AuthSignUpSuccessState extends AuthState {
  const AuthSignUpSuccessState();

  @override
  List<Object> get props => [];
}

final class AuthPasswordsDoesntMatchState extends AuthState {

  const AuthPasswordsDoesntMatchState();

  @override
  List<Object> get props => [];
}

final class AuthVerifyPhoneNumberErrorState extends AuthState {
  final String errorMessage;
  const AuthVerifyPhoneNumberErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class AuthVerifyPhoneNumberSuccessState extends AuthState {
  const AuthVerifyPhoneNumberSuccessState();

  @override
  List<Object> get props => [];
}

final class AuthResendOtpSuccessState extends AuthState {
  const AuthResendOtpSuccessState();

  @override
  List<Object> get props => [];
}

final class AuthResendOtpErrorState extends AuthState {
  final String errorMessage;
  const AuthResendOtpErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
 }

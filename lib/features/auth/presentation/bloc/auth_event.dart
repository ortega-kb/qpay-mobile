part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class AuthSignUpEvent extends AuthEvent {
  final String phone;
  final String email;
  final String fullName;
  final String password;
  final String accountType;

  AuthSignUpEvent({
    required this.phone,
    required this.email,
    required this.fullName,
    required this.password,
    required this.accountType,
  });

  @override
  List<Object> get props => [phone, email, fullName, password, accountType];
}

final class AuthVerifyPhoneNumberEvent extends AuthEvent {
  final String phone;
  final String otp;

  AuthVerifyPhoneNumberEvent({
    required this.phone,
    required this.otp,
  });

  @override
  List<Object> get props => [phone, otp];
}

final class AuthResendOtpEvent extends AuthEvent {
  final String phone;

  AuthResendOtpEvent({
    required this.phone,
  });

  @override
  List<Object> get props => [phone];
}

final class AuthSignInEvent extends AuthEvent {
  final String phone;
  final String password;

  const AuthSignInEvent({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [phone, password];
}

final class AuthSignOutEvent extends AuthEvent {
  const AuthSignOutEvent();

  @override
  List<Object?> get props => [];
}

final class AuthPasswordsDoesntMatchEvent extends AuthEvent {
  const AuthPasswordsDoesntMatchEvent();

  @override
  List<Object> get props => [];
}

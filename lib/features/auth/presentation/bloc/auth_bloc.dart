import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:qpay/core/shared/entities/user.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/auth/domain/usecases/usecases.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final VerifyPhoneUseCase _verifyPhoneUseCase;
  final ResendOtpCodeUseCase _resendOtpCodeUseCase;
  final SignOutUseCase _signOutUseCase;
  final Logger _logger;

  AuthBloc(
      {required SignInUseCase signInUseCase,
      required SignUpUseCase signUpUseCase,
      required VerifyPhoneUseCase verifyPhoneUseCase,
      required ResendOtpCodeUseCase resendOtpCodeUseCase,
      required SignOutUseCase signOutUseCase,
      required Logger logger})
      : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _verifyPhoneUseCase = verifyPhoneUseCase,
        _resendOtpCodeUseCase = resendOtpCodeUseCase,
        _signOutUseCase = signOutUseCase,
        _logger = logger,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthInitial());
    });

    on<AuthSignUpEvent>(signUp);
    on<AuthSignInEvent>(signIn);
    on<AuthSignOutEvent>(signOut);
    on<AuthResendOtpEvent>(resendOtp);
    on<AuthVerifyPhoneNumberEvent>(verifyPhoneNumber);
    on<AuthPasswordsDoesntMatchEvent>(passwordsDoesntMatch);
  }

  Future<void> signUp(
    AuthSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _signUpUseCase.call(
      SignUpParams(
          phone: event.phone,
          email: event.email,
          fullName: event.fullName,
          password: event.password,
          accountType: event.accountType),
    );

    response.fold(
      (err) => emit(AuthSignUpErrorState(err.message)),
      (response) => emit(AuthSignUpSuccessState()),
    );
  }

  Future<void> verifyPhoneNumber(
    AuthVerifyPhoneNumberEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _verifyPhoneUseCase.call(
      VerifyPhoneParams(
        phone: event.phone,
        otp: event.otp,
      ),
    );

    response.fold(
      (err) => emit(AuthVerifyPhoneNumberErrorState(err.message)),
      (response) => emit(AuthVerifyPhoneNumberSuccessState()),
    );
  }

  Future<void> resendOtp(
    AuthResendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _resendOtpCodeUseCase.call(
      ResendOtpCodeParams(event.phone),
    );

    response.fold(
      (err) => emit(AuthResendOtpErrorState(err.message)),
      (response) => emit(AuthResendOtpSuccessState()),
    );
  }

  Future<void> signIn(
    AuthSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _signInUseCase.call(
      SignInParams(
        phone: event.phone,
        password: event.password,
      ),
    );

    response.fold(
      (err) => emit(AuthSignInErrorState(err.message)),
      (response) => emit(AuthSignInSuccessState(response)),
    );
  }

  Future<void> signOut(
    AuthSignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _signOutUseCase.call(NoParams());

    response.fold(
      (err) => _logger.e(err.message),
      (response) => emit(AuthSignOutSuccessState()),
    );
  }

  Future<void> passwordsDoesntMatch(
    AuthPasswordsDoesntMatchEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthPasswordsDoesntMatchState());
  }
}

part of 'dependencies.dart';

final sl = GetIt.asNewInstance();

Future<void> dependencies() async {
  _initSVG();
  _initAuth();
  _initWallet();
  _initTransaction();
  _initQRCode();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(QRStaticModelAdapter());

  await dotenv.load();
  await Supabase.initialize(
    url: Secrets.supabaseUrl,
    anonKey: Secrets.supabaseKey,
  );

  final qrStaticBox = await Hive.openBox<QRStaticModel>('qr_static');
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  
  final appRouterConfig = AppRouterConfig(sharedPreferencesService);
  final userInformationService = UserInformationService(sharedPreferencesService);

  final logger = Logger();

  sl.registerLazySingleton(() => Supabase.instance.client);
  sl.registerLazySingleton(() => qrStaticBox);
  sl.registerLazySingleton(() => sharedPreferencesService);
  sl.registerLazySingleton(() => userInformationService);
  sl.registerLazySingleton(() => appRouterConfig);
  sl.registerLazySingleton(() => logger);
}

void _initSVG() async {
  await preloadSVG([
    ImagePath.svgTransfer,
    ImagePath.svgQrCode,
    ImagePath.svgPaymentReceive,
    ImagePath.emptyBro
  ]);
}

void _initAuth() async {
  sl
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        sl(),
        sl(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(sl()),
    )
    ..registerFactory(
      () => SignInUseCase(sl()),
    )
    ..registerFactory(
      () => SignUpUseCase(sl()),
    )
    ..registerFactory(
      () => SignOutUseCase(sl()),
    )
    ..registerFactory(
      () => VerifyPhoneUseCase(sl()),
    )
    ..registerFactory(
      () => ResendOtpCodeUseCase(sl()),
    )
    ..registerLazySingleton(
      () => AuthBloc(
          signInUseCase: sl(),
          signUpUseCase: sl(),
          verifyPhoneUseCase: sl(),
          resendOtpCodeUseCase: sl(),
          signOutUseCase: sl(),
          logger: sl()),
    );
}

void _initTransaction() async {}

void _initWallet() async {
  sl
    ..registerFactory<WalletRemoteDataSource>(
      () => WalletRemoteDataSourceImpl(sl()),
    )
    ..registerFactory<WalletRepository>(
      () => WalletRepositoryImpl(sl()),
    )
    ..registerFactory(
      () => AddWalletUseCase(sl()),
    )
    ..registerFactory(
      () => ChooseDefaultWalletUseCase(sl()),
    )
    ..registerFactory(
      () => DeleteWalletUseCase(sl()),
    )
    ..registerFactory(
      () => GetWalletsByUserCodeUseCase(sl()),
    )
    ..registerLazySingleton(
      () => WalletBloc(
        addWalletUseCase: sl(),
        chooseDefaultWalletUseCase: sl(),
        deleteWalletUseCase: sl(),
        getWalletsByUserCodeUseCase: sl(),
      ),
    );
}

void _initQRCode() async {
  sl
    ..registerFactory<QrStaticLocalDatasource>(
      () => QRStaticLocalDatasourceImpl(sl()),
    )
    ..registerFactory<QRStaticRepository>(
      () => QRStaticRepositoryImpl(sl()),
    )
    ..registerFactory(
      () => GetQRStatic(sl()),
    )
    ..registerFactory(
      () => AddQRStatic(sl()),
    )
    ..registerFactory(
      () => DeleteQRStatic(sl()),
    )
    ..registerLazySingleton(
      () => QRCodeBloc(
        getQRStatic: sl(),
        addQRStatic: sl(),
        deleteQRStatic: sl(),
      ),
    );
}

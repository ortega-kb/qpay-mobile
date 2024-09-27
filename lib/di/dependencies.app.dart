part of 'dependencies.dart';

final locator = GetIt.asNewInstance();

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
  final userInformationService =
      UserInformationService(sharedPreferencesService);

  final logger = Logger();

  locator.registerLazySingleton(() => Supabase.instance.client);
  locator.registerLazySingleton(() => qrStaticBox);
  locator.registerLazySingleton(() => sharedPreferencesService);
  locator.registerLazySingleton(() => userInformationService);
  locator.registerLazySingleton(() => logger);
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
  locator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        locator(),
        locator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(locator()),
    )
    ..registerFactory(
      () => SignInUseCase(locator()),
    )
    ..registerFactory(
      () => SignUpUseCase(locator()),
    )
    ..registerFactory(
      () => SignOutUseCase(locator()),
    )
    ..registerFactory(
      () => VerifyPhoneUseCase(locator()),
    )
    ..registerFactory(
      () => ResendOtpCodeUseCase(locator()),
    )
    ..registerLazySingleton(
      () => AuthBloc(
          signInUseCase: locator(),
          signUpUseCase: locator(),
          verifyPhoneUseCase: locator(),
          resendOtpCodeUseCase: locator(),
          signOutUseCase: locator(),
          logger: locator()),
    );
}

void _initTransaction() async {}

void _initWallet() async {
  locator
    ..registerFactory<WalletRemoteDataSource>(
      () => WalletRemoteDataSourceImpl(locator()),
    )
    ..registerFactory<WalletRepository>(
      () => WalletRepositoryImpl(locator()),
    )
    ..registerFactory(
      () => AddWalletUseCase(locator()),
    )
    ..registerFactory(
      () => ChooseDefaultWalletUseCase(locator()),
    )
    ..registerFactory(
      () => DeleteWalletUseCase(locator()),
    )
    ..registerFactory(
      () => GetWalletsByUserCodeUseCase(locator()),
    )
    ..registerLazySingleton(
      () => WalletBloc(
        addWalletUseCase: locator(),
        chooseDefaultWalletUseCase: locator(),
        deleteWalletUseCase: locator(),
        getWalletsByUserCodeUseCase: locator(),
      ),
    );
}

void _initQRCode() async {
  locator
    ..registerFactory<QrStaticLocalDatasource>(
      () => QRStaticLocalDatasourceImpl(locator()),
    )
    ..registerFactory<QRStaticRepository>(
      () => QRStaticRepositoryImpl(locator()),
    )
    ..registerFactory(
      () => GetQRStatic(locator()),
    )
    ..registerFactory(
      () => AddQRStatic(locator()),
    )
    ..registerFactory(
      () => DeleteQRStatic(locator()),
    )
    ..registerLazySingleton(
      () => QRCodeBloc(
        getQRStatic: locator(),
        addQRStatic: locator(),
        deleteQRStatic: locator(),
      ),
    );
}

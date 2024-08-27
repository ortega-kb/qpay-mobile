part of 'init_dependencies.dart';

final locator = GetIt.asNewInstance();

Future<void> initDependencies() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  _initSVG();
  _initAuth();
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

  locator.registerLazySingleton(() => Supabase.instance.client);
  locator.registerLazySingleton(() => qrStaticBox);
}

void _initSVG() async {
  await preloadSVG([
    ImagePath.svgTransfer,
    ImagePath.svgQrCode,
    ImagePath.svgPaymentReceive,
  ]);
}

void _initAuth() async {
  locator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(locator()),
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
      ),
    );
}

void _initTransaction() async {}

void _initWallet() async {}

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

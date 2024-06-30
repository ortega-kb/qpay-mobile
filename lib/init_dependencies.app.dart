part of 'init_dependencies.dart';

final locator = GetIt.asNewInstance();

Future<void> initDependencies() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  _initSVG();

  await dotenv.load();
  await Supabase.initialize(
    url: Secrets.supabaseUrl,
    anonKey: Secrets.supabaseKey,
  );

  locator.registerLazySingleton(() => Supabase.instance.client);
}


void _initSVG() async {
  await preloadSVG([
    ImagePath.svgTransfer,
    ImagePath.svgQrCode,
    ImagePath.svgPaymentReceive,
  ]);
}

void _initAuth() async {}

void _initTransaction() async {}

void _initWallet() async {}
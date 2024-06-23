part of 'init_dependencies.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  await dotenv.load();

}
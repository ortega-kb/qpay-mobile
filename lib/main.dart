import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qpay/di/dependencies.dart';
import 'package:qpay/qpay_app.dart';
import 'package:qpay/qpay_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = QpayBlocObserver();
  runApp(const QpayApp());
}

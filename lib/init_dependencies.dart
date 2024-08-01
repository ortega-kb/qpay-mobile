import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qpay/core/utils/image_path.dart';
import 'package:qpay/core/utils/secrets.dart';
import 'package:qpay/features/qr_code/data/datasources/qr_static_local_datasource.dart';
import 'package:qpay/features/qr_code/data/models/qr_static_model.dart';
import 'package:qpay/features/qr_code/data/repositories/qr_static_repository_impl.dart';
import 'package:qpay/features/qr_code/domain/repositories/qr_static_repository.dart';
import 'package:qpay/features/qr_code/domain/usecases/add_qr_static.dart';
import 'package:qpay/features/qr_code/domain/usecases/delete_qr_static.dart';
import 'package:qpay/features/qr_code/domain/usecases/get_qr_static.dart';
import 'package:qpay/features/qr_code/presentation/bloc/qr_code_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utils/preload_svg.dart';

part 'init_dependencies.app.dart';



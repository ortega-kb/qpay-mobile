import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qpay/core/shared/services/shared_preferences_service.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/utils/image_path.dart';
import 'package:qpay/core/utils/secrets.dart';
import 'package:qpay/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:qpay/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';
import 'package:qpay/features/auth/domain/usecases/resend_otp_code_use_case.dart';
import 'package:qpay/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:qpay/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:qpay/features/auth/domain/usecases/verify_phone_use_case.dart';
import 'package:qpay/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:qpay/features/qr_code/data/datasources/qr_static_local_datasource.dart';
import 'package:qpay/features/qr_code/data/models/qr_static_model.dart';
import 'package:qpay/features/qr_code/data/repositories/qr_static_repository_impl.dart';
import 'package:qpay/features/qr_code/domain/repositories/qr_static_repository.dart';
import 'package:qpay/features/qr_code/domain/usecases/add_qr_static.dart';
import 'package:qpay/features/qr_code/domain/usecases/delete_qr_static.dart';
import 'package:qpay/features/qr_code/domain/usecases/get_qr_static.dart';
import 'package:qpay/features/qr_code/presentation/bloc/qr_code_bloc.dart';
import 'package:qpay/features/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:qpay/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:qpay/features/wallet/domain/usecases/add_wallet_use_case.dart';
import 'package:qpay/features/wallet/domain/usecases/choose_default_wallet_use_case.dart';
import 'package:qpay/features/wallet/domain/usecases/delete_wallet_use_case.dart';
import 'package:qpay/features/wallet/domain/usecases/get_wallets_by_user_code_use_case.dart';
import 'package:qpay/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utils/preload_svg.dart';
import 'features/wallet/data/datasources/wallet_remote_data_source.dart';

part 'init_dependencies.app.dart';



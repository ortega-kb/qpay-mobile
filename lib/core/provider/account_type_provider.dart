import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/utils/enums/account_type.dart';

final accountTypeProvider =
    StateProvider<AccountType>((ref) => AccountType.PUBLIC);
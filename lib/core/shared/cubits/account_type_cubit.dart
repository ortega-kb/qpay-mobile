import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qpay/core/utils/enums/account_type.dart';

class AccountTypeCubit extends Cubit<String> {
  AccountTypeCubit() : super(AccountType.PUBLIC.name);
  void updateAccountType(AccountType accountType) => emit(accountType.name);
}

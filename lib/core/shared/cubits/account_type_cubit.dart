import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qpay/core/utils/account_type.dart';

class AccountTypeCubit extends Cubit<String> {
  AccountTypeCubit() : super(AccountType.PUBLIC.name);

  void updateAccountType(AccountType accountType) {
    debugPrint("ACCOUNT_TYPE_UPDATED: $accountType");
    emit(accountType.name);
  }
}
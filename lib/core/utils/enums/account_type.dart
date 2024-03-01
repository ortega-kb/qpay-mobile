import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AccountType {
  CORPORATE(type: "corporate"),
  PARTICULAR(type: "particular"),
  PUBLIC(type: "public");

  const AccountType({required this.type});
  final String type;
}

final accountTypeProvider =
    StateProvider<AccountType>((ref) => AccountType.PUBLIC);

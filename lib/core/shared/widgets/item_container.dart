import 'package:flutter/cupertino.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class ItemContainer extends StatelessWidget {
  final Widget content;

  const ItemContainer({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppDimen.p12),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimen.p4),
        child: content,
      ),
    );
  }
}

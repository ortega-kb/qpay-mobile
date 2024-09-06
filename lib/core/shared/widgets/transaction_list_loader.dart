import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/shared/widgets/transaction_item.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TransactionListLoader extends StatelessWidget {
  final int itemCount;
  final bool enabled;

  const TransactionListLoader({
    super.key,
    required this.itemCount,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      ignorePointers: true,
      enabled: enabled,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: AppColor.whiteGray,
        duration: Duration(seconds: 2),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
          leading: Bone.circle(size: 40),
          title: Bone.text(words: 2),
          subtitle: Bone.text(),
          trailing: Bone.text(words: 1),
        ),
        separatorBuilder: (context, index) => Separator(),
        itemCount: itemCount,
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class Progress extends StatelessWidget {
  final double size;
  final Color color;
  const Progress({
    super.key,
    this.color = AppColor.transparant,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppDimen.p12),
      ),
      child: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.primary, size: size / 2),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qpay/core/shared/widgets/progress.dart';
import 'package:qpay/core/theme/app_color.dart';

class MProgress extends StatelessWidget {
  final bool inAsyncCall;
  final Widget child;
  final double size;

  const MProgress(
      {super.key,
      required this.inAsyncCall,
      required this.child,
      this.size = 80});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      progressIndicator: Progress(
        color: AppColor.white,
        size: size,
      ),
      blur: 1,
      opacity: 0.2,
      child: child,
    );
  }
}

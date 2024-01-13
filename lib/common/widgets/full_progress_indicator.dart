import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class FullProgressIndicator extends StatelessWidget {
  const FullProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(medium)
      ),
      child: CupertinoActivityIndicator(
        color: primary,
      ),
    );
  }
}

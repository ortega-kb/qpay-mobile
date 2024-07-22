import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/app_dimen.dart';

class MButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const MButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.p32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimen.p16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColor.white,
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/app_dimen.dart';

class MSubtitle extends StatelessWidget {
  final String title;
  final double padding;

  const MSubtitle({super.key, required this.title, this.padding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColor.gray,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
      ),
    );
  }
}

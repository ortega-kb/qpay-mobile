import 'package:flutter/material.dart';

import '../../color.dart';
import '../../spacing.dart';

class TitleMore extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color? color;

  const TitleMore({super.key, required this.title, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                color: color,
                fontWeight: FontWeight.bold),
          ),
          if (onTap != null)
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(middleSmall),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: extraSmall,
                  horizontal: small,
                ),
                child: Text(
                  "see_more",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: gray,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

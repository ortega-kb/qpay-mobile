import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class TitleMore extends StatelessWidget {
  final void Function()? onTap;
  final String title;

  const TitleMore({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocaleText(
            title,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                color: black,
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
                child: LocaleText(
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

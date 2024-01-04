import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class QuickOperationsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const QuickOperationsTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(middleSmall),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: small),
          child: Row(
            children: [
              const SizedBox(width: medium),
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
                child: Padding(
                  padding: const EdgeInsets.all(small),
                  child: Icon(icon, color: surface, size: 15),
                ),
              ),
              const SizedBox(width: medium),
              LocaleText(
                title,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize),
              ),
              const SizedBox(width: medium)
            ],
          ),
        ),
      ),
    );
  }
}

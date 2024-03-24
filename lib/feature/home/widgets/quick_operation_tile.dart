import 'package:flutter/material.dart';

import '../../../core/design/color.dart';
import '../../../core/design/spacing.dart';

class QuickOperationTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const QuickOperationTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(middleSmall),
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: background,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(small),
                  child: Icon(
                    icon,
                    color: black,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(width: medium),
              Text(
                title,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
              ),
              const SizedBox(width: medium)
            ],
          ),
        ),
      ),
    );
  }
}

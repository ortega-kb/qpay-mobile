import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/spacing.dart';

class TitleAction extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const TitleAction({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      dense: true,
      trailing: onTap != null
          ? InkWell(
              radius: 20,
              borderRadius: BorderRadius.circular(medium),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(small),
                child: Text(
                  AppLocalizations.of(context)!.see_more,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: primary,
                      ),
                ),
              ),
            )
          : null,
    );
  }
}

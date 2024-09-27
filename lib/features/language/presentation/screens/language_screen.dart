import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/cubits/language/language_cubit.dart';
import 'package:qpay/core/shared/cubits/language/language_cubit.dart';
import 'package:qpay/core/shared/widgets/item_container.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/enums/language_type.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languages),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimen.p16),
              BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  return ItemContainer(
                    content: Column(
                      children: [
                        LanguageItem(
                          title: AppLocalizations.of(context)!.french,
                          selected: state.language == LanguageType.fr.name,
                          onTap: () =>
                              context
                                  .read<LanguageCubit>()
                                  .changeLanguage(LanguageType.fr.name),
                        ),
                        Separator(isLarge: false),
                        LanguageItem(
                          title: AppLocalizations.of(context)!.english,
                          selected: state.language == LanguageType.en.name,
                          onTap: () =>
                              context
                                  .read<LanguageCubit>()
                                  .changeLanguage(LanguageType.en.name),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final title;
  final selected;
  final Function()? onTap;

  const LanguageItem({super.key,
    required this.title,
    required this.selected,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      trailing: selected
          ? Icon(
        Icons.check_circle,
        color: AppColor.primary,
      )
          : null,
    );
  }
}

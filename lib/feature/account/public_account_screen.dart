import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/common/widgets/auth_title.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/subtitle.dart';
import '../../core/design/spacing.dart';

class PublicAccountScreen extends ConsumerStatefulWidget {
  const PublicAccountScreen({super.key});

  @override
  ConsumerState createState() => _InformationScreenState();
}

class _InformationScreenState extends ConsumerState<PublicAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _postNameController = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: AppLocalizations.of(context)!.go,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: extraLarge),
            AuthTitle(
              title: AppLocalizations.of(context)!.account(
                AppLocalizations.of(context)!.public,
              ),
            ),
            const SizedBox(height: middleSmall),
            Subtitle(
              text: AppLocalizations.of(context)!.text_account,
            ),
            const SizedBox(
              height: middleSmall,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MTextField(
                      controller: _nameController,
                      label: AppLocalizations.of(context)!.name,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {},
                    ),
                    const SizedBox(height: medium),
                    MTextField(
                      controller: _postNameController,
                      label: AppLocalizations.of(context)!.post_name,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {},
                    ),
                    const SizedBox(height: medium),
                    MTextField(
                      controller: _dateOfBirth,
                      label: AppLocalizations.of(context)!.date_of_birth,
                      obscureText: false,
                      keyboardType: TextInputType.datetime,
                      validator: (value) {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

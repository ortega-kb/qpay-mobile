import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/register_marchand/widgets/register_marchand_indicator.dart';
import 'package:qpay/providers/register_step_marchand_provider.dart';

import '../../common/widgets/auth_title.dart';
import '../../common/widgets/m_button.dart';
import '../../common/widgets/m_text_field.dart';
import '../../common/widgets/subtitle.dart';
import '../../routing/app_routes.dart';
import '../../utils/color.dart';
import '../../utils/spacing.dart';
import '../register/widgets/register_indicator.dart';

class RegisterMarchandScreen extends StatelessWidget {
  const RegisterMarchandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _denominationController = TextEditingController();
    TextEditingController _electronicAddressController =
        TextEditingController();
    TextEditingController _countryOfImplementationController =
        TextEditingController();
    TextEditingController _activitySectorController = TextEditingController();
    TextEditingController _province = TextEditingController();

    TextEditingController _townController = TextEditingController();
    TextEditingController _communeController = TextEditingController();
    TextEditingController _avenueController = TextEditingController();
    TextEditingController _numberController = TextEditingController();

    TextEditingController _natIdController = TextEditingController();
    TextEditingController _rccmController = TextEditingController();
    TextEditingController _idDocController = TextEditingController();

    final steps = [
      // step 1
      Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: medium),
          child: Column(
            children: [
              MTextField(
                controller: _denominationController,
                label: "denomination_entreprise",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _electronicAddressController,
                label: "electronic_address",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _countryOfImplementationController,
                label: "country_of_implementation",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _activitySectorController,
                label: "activity_sector",
                obscureText: false,
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _province,
                label: "province",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
            ],
          ),
        ),
      ),

      // step 2
      Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: medium),
          child: Column(
            children: [
              MTextField(
                controller: _townController,
                label: "town",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _communeController,
                label: "commune",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _avenueController,
                label: "country_of_residence",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _numberController,
                label: "phone_number",
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: medium),
            ],
          ),
        ),
      ),

      // step 3
      Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MTextField(
                controller: _natIdController,
                label: "identification_nat",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _rccmController,
                label: "rccm",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _avenueController,
                label: "doc_id",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MButton(
                text: "create_account",
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.verifyAccount,
                ),
              )
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Consumer<RegisterStepMarchandProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(medium),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => provider.stepCancel(),
                  icon: Icon(
                    CupertinoIcons.back,
                    color: gray,
                  ),
                ),
                RegisterMarchandIndicator(page: provider.currentStep),
                IconButton(
                  onPressed: () => provider.stepContinue(),
                  icon: Icon(
                    CupertinoIcons.forward,
                    color: gray,
                  ),
                )
              ],
            ),
          );
        },
      ),
      body: Consumer<RegisterStepMarchandProvider>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              AuthTitle(title: "create_account_marchand"),
              const SizedBox(height: medium),
              Subtitle(text: "subtitle_account_marchand"),
              const SizedBox(height: medium),
              steps[provider.currentStep]
            ],
          );
        },
      ),
    );
  }
}

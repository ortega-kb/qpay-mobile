import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/auth_title.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_text_field.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/features/register/widgets/register_indicator.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/spacing.dart';

import '../../providers/register_step_provider.dart';
import '../../utils/color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // step 1
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _postNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _sexBirthController = TextEditingController();

  // step 2
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _electronicAddressController = TextEditingController();
  TextEditingController _countryOfResidenceController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();

  // step 3
  TextEditingController _townController = TextEditingController();
  TextEditingController _communeController = TextEditingController();
  TextEditingController _avenueController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();

  // step 4
  TextEditingController _seriesNumberController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final steps = [
      // step 1
      Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: medium),
          child: Column(
            children: [
              MTextField(
                controller: _firstNameController,
                label: "first_name",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _nameController,
                label: "name",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _postNameController,
                label: "post_name",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _dateOfBirthController,
                label: "date_of_birth",
                obscureText: false,
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _sexBirthController,
                label: "sex",
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
                controller: _nationalityController,
                label: "nationality",
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
                controller: _countryOfResidenceController,
                label: "country_of_residence",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _phoneNumberController,
                label: "phone_number",
                obscureText: false,
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _provinceController,
                label: "province",
                obscureText: false,
                keyboardType: TextInputType.text,
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
                label: "avenue",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _numberController,
                label: "number",
                obscureText: false,
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _occupationController,
                label: "occupation",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
            ],
          ),
        ),
      ),

      // step 4
      Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(medium),
                ),
                child: Column(
                  children: [],
                ),
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _seriesNumberController,
                label: "series_number",
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: medium),
              MTextField(
                controller: _passwdController,
                label: "password",
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: medium),
              MButton(
                text: "create_account",
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.verifyAccount),
              )
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Consumer<RegisterStepProvider>(
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
                RegisterIndicator(page: provider.currentStep),
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
      body: Consumer<RegisterStepProvider>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              AuthTitle(title: "creating_account"),
              const SizedBox(height: medium),
              Subtitle(text: "subtitle_creating_account"),
              const SizedBox(height: medium),
              steps[provider.currentStep]
            ],
          );
        },
      ),
    );
  }
}

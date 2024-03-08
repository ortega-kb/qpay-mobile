import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/provider/public_account_provider.dart';
import 'package:qpay/core/utils/enums/gender.dart';
import 'package:qpay/feature/account/widget/header_public_account.dart';
import 'package:qpay/feature/upload_picture/upload_picture_screen.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_date_field.dart';
import '../../core/design/common/widgets/m_select_fied.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/spacing.dart';
import '../../core/design/validator.dart';

class PublicAccountScreen extends ConsumerStatefulWidget {
  const PublicAccountScreen({super.key});

  @override
  ConsumerState createState() => _InformationScreenState();
}

class _InformationScreenState extends ConsumerState<PublicAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  // first form
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _postNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  // second form
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _communeController = TextEditingController();
  final TextEditingController _avenueController = TextEditingController();
  final TextEditingController _numberAvenueController = TextEditingController();

  @override
  void initState() {
    _genderController.text = Gender.M.value;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _postNameController.dispose();
    _dateOfBirthController.dispose();
    _genderController.dispose();

    _cityController.dispose();
    _avenueController.dispose();
    _communeController.dispose();
    _numberAvenueController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentPage = ref.watch(publicAccountProvider);
    var pageController = PageController(initialPage: currentPage);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            if (pageController.page?.round() == 0) {
              Navigator.pop(context);
            } else {
              pageController.previousPage(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
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
          onTap: () {
            if (pageController.page?.round() == 1) {
              Navigator.push(
                context,
                animateRoute(
                  UploadPictureScreen(),
                ),
              );
            } else {
              pageController.nextPage(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          // first form
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderPublicAccount(),
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
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                        MTextField(
                          controller: _postNameController,
                          label: AppLocalizations.of(context)!.post_name,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                        MDateField(
                          label: AppLocalizations.of(context)!.date_of_birth,
                          dateTime: ref.watch(dateStateProvider),
                          onChanged: (value) {
                            ref
                                .read(dateStateProvider.notifier)
                                .update((state) => value);

                            _dateOfBirthController.text =
                                ref.watch(dateStateProvider).toString();

                            debugPrint("[+] $_dateOfBirthController");
                          },
                        ),
                        const SizedBox(height: medium),
                        MSelectField(
                          selectEditingController: _genderController,
                          initialValue: null,
                          label: AppLocalizations.of(context)!.gender,
                          items: [
                            {
                              'value': Gender.M.value,
                              'label': AppLocalizations.of(context)!.male,
                              'textStyle': TextStyle(
                                color: gray,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.fontSize,
                              )
                            },
                            {
                              'value': Gender.F.value,
                              'label': AppLocalizations.of(context)!.female,
                              'textStyle': TextStyle(
                                color: gray,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.fontSize,
                              ),
                            },
                          ],
                        ),
                        const SizedBox(height: medium),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // second form
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderPublicAccount(),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MTextField(
                          controller: _cityController,
                          label: AppLocalizations.of(context)!.city,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                        MTextField(
                          controller: _communeController,
                          label: AppLocalizations.of(context)!.commune,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                        MTextField(
                          controller: _avenueController,
                          label: AppLocalizations.of(context)!.avenue,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                        MTextField(
                          controller: _numberAvenueController,
                          label: AppLocalizations.of(context)!.number,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        onPageChanged: (value) {
          ref.read(publicAccountProvider.notifier).update((_) => value);
        },
      ),
    );
  }
}

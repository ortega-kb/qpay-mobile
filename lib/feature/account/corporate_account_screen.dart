import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/provider/corporate_account_provider.dart';
import 'package:qpay/feature/account/widget/header_corporate_account.dart';

import '../../core/design/animator_route.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_date_field.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/spacing.dart';
import '../../core/design/validator.dart';
import '../upload_picture/upload_picture_screen.dart';

class CorporateAccountScreen extends ConsumerStatefulWidget {
  const CorporateAccountScreen({super.key});

  @override
  ConsumerState createState() => _InformationScreenState();
}

class _InformationScreenState extends ConsumerState<CorporateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  // first form
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _soaController = TextEditingController();
  final TextEditingController _rccmController = TextEditingController();
  final TextEditingController _ccdController = TextEditingController();

  // second form
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _communeController = TextEditingController();
  final TextEditingController _avenueController = TextEditingController();
  final TextEditingController _numberAvenueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPage = ref.watch(corporateAccountProvider);
    var pageController = PageController(initialPage: currentPage);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                HeaderCorporateAccount(),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MTextField(
                          controller: _companyNameController,
                          label: AppLocalizations.of(context)!.company_name,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                        MTextField(
                          controller: _soaController,
                          label:
                              AppLocalizations.of(context)!.sector_of_activity,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: medium),
                        MTextField(
                          controller: _rccmController,
                          label: AppLocalizations.of(context)!.rccm_number,
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

                            _ccdController.text =
                                ref.watch(dateStateProvider).toString();

                            debugPrint("[+] $_ccdController");
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

          // second form
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderCorporateAccount(),
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
          ref.read(corporateAccountProvider.notifier).update((_) => value);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/messages.dart';
import 'package:qpay/core/utils/constants/link.dart';
import 'package:qpay/core/utils/launcher.dart';
import 'package:qpay/feature/login/login_state.dart';
import 'package:qpay/feature/login/login_view_model.dart';

import '../../core/design/common/widgets/auth_title.dart';
import '../../core/design/common/widgets/full_progress_indicator.dart';
import '../../core/design/common/widgets/link_text.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_outlined_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/subtitle.dart';
import '../../core/design/spacing.dart';
import '../../core/design/validator.dart';
import '../register/register_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);

    ref.listen(loginViewModelProvider, (previous, next) {
      if (next is Error) {
        Messages.error(next.e.toString(), context);
      } else if (next is Success) {
        Messages.success("Login success", context);
      }
    });

    void showPrivacyPolicy() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: background,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Subtitle(
                    text: AppLocalizations.of(context)!.see_policy,
                    color: black,
                    fontWeight: FontWeight.bold,
                    padding: 0,
                  ),
                  dense: true,
                  trailing: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      size: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: medium,
                    right: medium,
                    top: medium,
                    bottom: medium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Subtitle(
                        text: AppLocalizations.of(context)!.introduction,
                        padding: 0,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: medium),
                      Text(
                        "La présente politique de confidentialité (la « Politique ») décrit comment nous, Qpay, recueillons, utilisons et partageons les informations vous concernant lorsque vous utilisez notre application mobile Qpay.",
                      ),
                      const SizedBox(height: medium),
                      Subtitle(
                        text: AppLocalizations.of(context)!
                            .security_of_information,
                        padding: 0,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: medium),
                      Text(
                        "Nous prenons des mesures de sécurité techniques et organisationnelles pour protéger vos informations contre l'accès non autorisé, l'utilisation ou la divulgation.",
                      ),
                      const SizedBox(height: medium),
                      Subtitle(
                        text: AppLocalizations.of(context)!
                            .information_we_collect,
                        padding: 0,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: medium),
                      Text(
                        "Lorsque vous utilisez l'Application, nous pouvons recueillir les informations suivantes vous concernant :",
                      ),
                      const SizedBox(
                        height: medium,
                      ),
                      Text(
                        " * Informations de compte",
                      ),
                      Text(
                        " * Informations de transaction",
                      ),
                      Text(
                        " * Autres informations",
                      ),
                      const SizedBox(height: medium),
                      Subtitle(
                        text: AppLocalizations.of(context)!
                            .how_use_your_information,
                        padding: 0,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: medium),
                      Text("Nous utilisons vos informations pour :"),
                      const SizedBox(height: medium),
                      Text(" * Fournir et améliorer l'application"),
                      Text(" * Traiter vos transactions mobiles"),
                      Text(
                          " * Protéger notre entreprise contre la fraude et les abus"),
                      Text(" * Fournir et améliorer l'application"),
                      const SizedBox(height: medium),
                      Subtitle(
                        text: AppLocalizations.of(context)!.contact,
                        padding: 0,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: medium),
                      Text(
                          "Si vous avez des questions sur la présente Politique, veuillez nous contacter à l'adresse suivante :"),
                      LinkText(
                        text: Link.qpayEmailContact,
                        onTap: () {
                          Launcher.linkEmail(Link.qpayEmailContact);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return ModalProgressHUD(
      progressIndicator: FullProgressIndicator(),
      inAsyncCall: (state is Loading) ? true : false,
      opacity: 0.3,
      blur: 1,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: extraLarge),
              AuthTitle(title: AppLocalizations.of(context)!.connection),
              const SizedBox(height: middleSmall),
              Subtitle(text: AppLocalizations.of(context)!.text_connection),
              const SizedBox(height: middleSmall),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: medium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MTextField(
                        controller: _phoneController,
                        label: AppLocalizations.of(context)!.phone_number,
                        prefixIcon: Column(
                          children: [
                            Text(
                              "🇨🇩 +243 ",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: gray),
                            )
                          ],
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          return Validator.phoneValidator(value!);
                        },
                      ),
                      const SizedBox(height: medium),
                      LinkText(
                        text: AppLocalizations.of(context)!.see_policy,
                        onTap: showPrivacyPolicy,
                      ),
                      const SizedBox(height: medium),
                      MButton(
                        text: AppLocalizations.of(context)!.login,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(loginViewModelProvider.notifier)
                                .login(_phoneController.text.trim());
                          }
                        },
                      ),
                      const SizedBox(height: medium),
                      MOutlinedButton(
                        text: AppLocalizations.of(context)!.create_account,
                        onTap: () {
                          Navigator.push(
                            context,
                            animateRoute(
                              RegisterScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: large),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MTextField(
//   controller: _passwordController,
//   label: AppLocalizations.of(context)!.passwd,
//   obscureText: ref.watch(mPasswordFieldProvider),
//   keyboardType: TextInputType.visiblePassword,
//   validator: (value) {
//     return Validator.passwordValidator(value);
//   },
//   suffixIcon: ref.watch(mPasswordFieldProvider)
//       ? IconButton(
//           onPressed: () {
//             ref
//                 .read(mPasswordFieldProvider.notifier)
//                 .setObscuredText(false);
//           },
//           icon: Icon(CupertinoIcons.eye_solid))
//       : IconButton(
//           onPressed: () {
//             ref
//                 .read(mPasswordFieldProvider.notifier)
//                 .setObscuredText(true);
//           },
//           icon: Icon(
//             CupertinoIcons.eye_slash_fill,
//           ),
//         ),
// ),

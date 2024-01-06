import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/features/register/widgets/register_indicator.dart';
import 'package:qpay/provider/register_step_provider.dart';
import 'package:qpay/utils/spacing.dart';

import '../../utils/color.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "creating_account"),
      ),
      bottomNavigationBar: Consumer<RegisterStepProvider>(
        builder: (context, provider, child) {
          return Row(
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
          );
        },
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Subtitle(text: "subtitle_creating_account"),
          const SizedBox(height: medium),
          ...[]
        ],
      ),
    );
  }
}

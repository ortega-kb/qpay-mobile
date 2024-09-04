import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/dashboard/presentation/bloc/cubits/time_report_cubit.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.reports,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppDimen.p16),
          BlocBuilder<TimeReportCubit, int>(
            builder: (context, state) {
              return CupertinoSegmentedControl<int>(
                children: {
                  0: Text(AppLocalizations.of(context)!.weekly),
                  1: Text(AppLocalizations.of(context)!.monthly),
                  2: Text(AppLocalizations.of(context)!.yearly)
                },
                groupValue: state,
                onValueChanged: (value) {
                  context.read<TimeReportCubit>().onChangeTime(value);
                },
              );
            },
          ),
          const SizedBox(height: AppDimen.p16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: AppDimen.p16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(AppDimen.p16)),
                    ),
                  ),
                  const SizedBox(height: AppDimen.p16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(AppDimen.p16)),
                    ),
                  ),
                  const SizedBox(height: AppDimen.p16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(AppDimen.p16)),
                    ),
                  ),
                  const SizedBox(height: AppDimen.p16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/config/app_route_name.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_static_detail_screen.dart';
import 'package:qpay/features/qr_code/presentation/widgets/qr_static_item.dart';

import '../../../../core/shared/widgets/not_found.dart';
import '../../../../core/shared/widgets/separator.dart';
import '../../../../core/theme/app_dimen.dart';
import '../../../../core/utils/image_path.dart';
import '../../domain/entities/qr_static.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrStaticList extends StatelessWidget {
  final List<QRStatic> qrStatics;
  final Function(int) onDeleteQrStatic;

  const QrStaticList({
    super.key,
    required this.qrStatics,
    required this.onDeleteQrStatic
  });

  @override
  Widget build(BuildContext context) {
    return qrStatics.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(vertical: AppDimen.p16),
            itemBuilder: (context, index) {
              final qrStatic = qrStatics[index];
              return QRStaticItem(
                qrStatic: qrStatic,
                index: index,
                onTap: () => context.push(
                  QRStaticDetailScreen.route,
                  extra: json.encode(
                    qrStatic.toJson(),
                  ),
                ),
                onDelete: () => onDeleteQrStatic(index),
              );
            },
            separatorBuilder: (context, int) => Separator(),
            itemCount: qrStatics.length,
          )
        : NotFound(
            image: ImagePath.emptyBro,
            message: AppLocalizations.of(context)!.qr_code_not_found,
          );
  }
}

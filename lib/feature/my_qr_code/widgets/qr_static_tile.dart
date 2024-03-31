import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/domain/entity/qr_static.dart';

import '../../../core/design/color.dart';
import '../../../core/design/spacing.dart';

class QRStaticTile extends StatelessWidget {
  final QRStatic qrStatic;
  final Function() onTap;
  final Function() onDelete;

  const QRStaticTile({
    super.key,
    required this.qrStatic,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: small),
      child: Container(
        decoration: BoxDecoration(
            color: surface, borderRadius: BorderRadius.circular(middleSmall)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(middleSmall),
          child: ListTile(
            dense: true,
            title: Text(
              qrStatic.motif,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              qrStatic.amount.toString() + " ${qrStatic.currency}",
              style: TextStyle(
                color: gray,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              ),
            ),
            trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(FontAwesomeIcons.trash),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/utils/spacing.dart';

import '../../../utils/color.dart';

class ProfileExtended extends StatelessWidget {
  final double size;
  final String name;
  final String id;

  const ProfileExtended(
      {super.key, required this.size, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
        ),
        const SizedBox(height: small),
        Text(
          name,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              color: black),
        ),
        const SizedBox(height: extraSmall),
        Text(
          id,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: gray),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(color: gray, shape: BoxShape.circle),
            ),
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle
                  ),
                  child: const Icon(
                    CupertinoIcons.camera_fill,
                    color: surface,
                    size: 15,
                  ),
                ),
              )
            )
          ],
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
            color: gray,
          ),
        ),
      ],
    );
  }
}

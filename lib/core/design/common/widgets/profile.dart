import 'package:flutter/material.dart';

import '../../color.dart';

class Profile extends StatelessWidget {
  final double size;
  final Function()? onTap;

  const Profile({
    super.key,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 15,
      borderRadius: BorderRadius.circular(15 / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: primary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/spacing.dart';

class AddProfile extends StatelessWidget {
  final Function()? onTap;
  const AddProfile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(large),
          color: gray,
        ),
        child: Icon(
          FontAwesomeIcons.camera,
          color: Colors.white,
        ),
      ),
    );
  }
}

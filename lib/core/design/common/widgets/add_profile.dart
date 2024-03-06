import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/spacing.dart';

class AddProfile extends StatelessWidget {
  final Function()? onTap;
  final Function()? onDeletePicture;
  final File? image;
  final double radius;
  const AddProfile(
      {super.key,
      required this.onTap,
      required this.image,
      this.radius = 60,
      required this.onDeletePicture});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Padding(
        padding: const EdgeInsets.all(extraSmall),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: image == null ? null : FileImage(image!),
          backgroundColor: gray,
          child: image == null
              ? Icon(
                  FontAwesomeIcons.camera,
                  color: Colors.white,
                )
              : IconButton(
                  tooltip: AppLocalizations.of(context)!.delete_picture,
                  onPressed: onDeletePicture,
                  color: Colors.white,
                  icon: Icon(
                    FontAwesomeIcons.trashCan,
                  ),
                ),
        ),
      ),
    );
  }
}

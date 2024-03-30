import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/spacing.dart';

class FreezedToastMessage extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String subtitle;

  const FreezedToastMessage(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(small),
        color: surface,
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          FontAwesomeIcons.triangleExclamation,
          color: Colors.yellow,
          size: 15,
        ),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: gray,
          ),
        ),
        trailing: InkWell(
          borderRadius: BorderRadius.circular(medium),
          onTap: onTap,
          child: Icon(
            CupertinoIcons.xmark,
            color: gray,
            size: 15,
          ),
        ),
      ),
    );
  }
}

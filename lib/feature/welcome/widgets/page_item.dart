import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/design/color.dart';
import '../../../core/design/spacing.dart';

class PageItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const PageItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(image),
          Text(
            title,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                color: gray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

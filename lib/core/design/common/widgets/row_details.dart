import 'package:flutter/material.dart';

import '../../color.dart';
import '../../spacing.dart';

class RowDetails extends StatelessWidget {
  final String title;
  final String value;

  const RowDetails({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: medium,
        vertical: middleSmall,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              color: black,
            ),
          )
        ],
      ),
    );
  }
}

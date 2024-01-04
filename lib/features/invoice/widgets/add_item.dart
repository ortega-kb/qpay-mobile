import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../utils/color.dart';

class AddItem extends StatelessWidget {
  final void Function()? onPressed;
  const AddItem({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "item",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: gray,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
      ),
      trailing: IconButton(
        color: primary,
        onPressed: onPressed,
        icon: Icon(
          Icons.add,
          color: primary,
        ),
      ),
    );
  }
}

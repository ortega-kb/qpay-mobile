import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/design/color.dart';

class ParamTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onTap;

  const ParamTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      splashColor: Colors.transparent,
      leading: Icon(iconData),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      trailing: Icon(
        CupertinoIcons.forward,
        color: gray,
      ),
    );
  }
}

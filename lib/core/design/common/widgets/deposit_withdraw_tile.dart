import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DepositWithDrawTile extends StatelessWidget {
  final String image;
  final String name;
  final String tarif;
  final void Function()? onTap;

  const DepositWithDrawTile({
    super.key,
    required this.name,
    required this.tarif,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
      title: Text(name),
      subtitle: Text(tarif + "%"),
      trailing: Icon(CupertinoIcons.chevron_forward, size: 20),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class MainNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const MainNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      useLegacyColorScheme: false,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          activeIcon: Icon(CupertinoIcons.house_fill),
          label: Locales.string(context, "home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.square_list),
          activeIcon: Icon(CupertinoIcons.square_list_fill),
          label: Locales.string(context, "invoice"),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_crop_circle),
          activeIcon: Icon(CupertinoIcons.person_crop_circle_fill),
          label: Locales.string(context, "profile"),
        ),
      ],
    );
  }
}

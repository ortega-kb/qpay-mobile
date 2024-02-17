import 'package:flutter/cupertino.dart';

import '../../color.dart';

class Profile extends StatelessWidget {
  final double size;
  const Profile({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../color.dart';

class FullProgressIndicator extends StatelessWidget {
  const FullProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: primary,
      radius: 15.0,
    );
  }
}

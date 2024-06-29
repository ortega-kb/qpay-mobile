import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingImage extends StatelessWidget {
  final imagePath;

  const OnBoardingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: 400,
      imagePath,
    );
  }
}

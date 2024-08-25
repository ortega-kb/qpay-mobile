import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingImage extends StatelessWidget {
  final imagePath;

  const OnBoardingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 16.0 / 13.0,
        child: SvgPicture.asset(
          height: 300,
          imagePath,
        ),
      ),
    );
  }
}

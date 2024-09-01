import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class NotFound extends StatelessWidget {
  final String image;
  final String message;

  const NotFound({
    super.key,
    required this.image,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: 200,
            image,
          ),
          const SizedBox(height: AppDimen.p16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColor.greyColor,
                ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

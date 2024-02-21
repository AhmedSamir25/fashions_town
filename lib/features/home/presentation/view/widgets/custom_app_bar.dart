import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Image.asset(
          AssetsManager.logoApp,
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Shimmer.fromColors(
            period: const Duration(seconds: 12),
            baseColor: appColor,
            highlightColor: highlightColor,
            child: Text(
              "Galaxy Store",
              style: TextStyles.textStyle18,
            )),
      ],
    );
  }
}
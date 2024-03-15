import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
              aspectRatio: 2 / 1, child: Image.asset(AssetsManager.cartEmpty)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            "No Products in Cart",
            style: TextStyles.textStyle18,
          )
        ],
      ),
    );
  }
}
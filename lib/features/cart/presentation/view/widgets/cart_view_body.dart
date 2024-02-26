import 'package:fashionstown/features/cart/presentation/view/widgets/list_cart_product.dart';
import 'package:fashionstown/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 57, left: 12, right: 12),
        child: Column(
          children: [
            CustomAppBar(appBarText: 'My Cart'),
            Expanded(child: ListCartProduct()),
          ],
        ),
      ),
    );
  }
}

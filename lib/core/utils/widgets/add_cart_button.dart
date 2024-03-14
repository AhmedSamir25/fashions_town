import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/utils/widgets/custom_button_icon.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key, required this.productId, required this.productImage, required this.productName, required this.productPrice, required this.productCategory});
final String productId, productImage, productName, productPrice, productCategory;
  @override
  Widget build(BuildContext context) {
   final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return CusttomIconButton(
          colorIcon: cartCubit.isProductsInCart(
                  productId: productId)
              ? appColor
              : textButtonAndMassage,
          onPressed: () {
            cartCubit.addCart(
              productId: productId,
              productName: productName,
              productImage: productImage,
              productPrice: productPrice,
              productCategory: productPrice,
              productCount: 1,
            );
            BlocProvider.of<CartCubit>(context).getCartData();
          },
          icon: const Icon(Icons.shopping_cart),
        );
      },
    );
  }
}

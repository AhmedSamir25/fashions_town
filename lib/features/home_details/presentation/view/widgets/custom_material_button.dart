import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_style.dart';

class CustomMaterialButton extends StatefulWidget {
  const CustomMaterialButton(
      {super.key,
      required this.productCount,
      required this.productCategory,
      required this.productPrice,
      required this.productImage,
      required this.productName,
      required this.productId});
  final int productCount;
  final String productCategory;
  final String productPrice;
  final String productImage;
  final String productName;
  final String productId;

  @override
  State<CustomMaterialButton> createState() => _CustomMaterialButtonState();
}

class _CustomMaterialButtonState extends State<CustomMaterialButton> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return MaterialButton(
          color: appColor,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.symmetric(vertical: 12),
          onPressed: () {
            cartCubit.addCart(
                productId: widget.productId,
                productName: widget.productName,
                productImage: widget.productImage,
                productPrice: widget.productPrice,
                productCategory: widget.productCategory,
                productCount: widget.productCount);
            cartCubit.getCartData();
            cartCubit.isProductsInCart(productId: widget.productId);
          },
          child: Text(
            cartCubit.isProductsInCart(productId: widget.productId)
                ? 'product in cart'
                : 'add cart',
            style: TextStyles.textStyle18,
          ),
        );
      },
    );
  }
}

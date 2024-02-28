import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fashionstown/features/cart/presentation/view/widgets/check_out_cart.dart';
import 'package:fashionstown/features/cart/presentation/view/widgets/list_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCartProduct extends StatefulWidget {
  const ListCartProduct({super.key});

  @override
  State<ListCartProduct> createState() => _ListCartProductState();
}

class _ListCartProductState extends State<ListCartProduct> {
  double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartProductSuccess) {
          totalPrice = state.cartProducts.fold(
              0.0,
              (previous, current) =>
                  previous +
                  (current.productCount ?? 1) *
                      double.parse('${current.productPrice}'));
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: state.cartProducts.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      // print(totalCart);
                      return CustomListCart(
                        networkImage:
                            //searchedproducts
                            "${state.cartProducts[index].productImage}",
                        productName: "${state.cartProducts[index].productName}",
                        productPrice:
                            "${state.cartProducts[index].productPrice}\$",
                        productCount:
                            state.cartProducts[index].productCount ?? 1,
                        onPressedDecrease: () {
                          setState(() {
                            cartCubit.controlTheNumberOfItem(
                                productId:
                                    "${state.cartProducts[index].productId}",
                                valueButton:
                                    (state.cartProducts[index].productCount ??1) -1);
                            cartCubit.getCartData();
                          });
                        },
                        onPressedIncrease: () {
                          setState(() {
                            cartCubit.controlTheNumberOfItem(
                                productId:
                                    "${state.cartProducts[index].productId}",
                                valueButton:
                                    (state.cartProducts[index].productCount ??1) +1);
                            cartCubit.getCartData();
                          });
                        },
                      );
                    }),
              ),
              OrderNow(totalCart: totalPrice),
            ],
          );
        } else if (state is FieldGetCartProductData) {
          return Text(
            state.massage,
            style: TextStyles.textStyle16,
          );
        } else {
          return ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 1,
                  child: const LoadingShimmer());
            },
          );
        }
      },
    );
  }
}
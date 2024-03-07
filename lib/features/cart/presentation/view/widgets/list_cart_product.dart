import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fashionstown/features/cart/presentation/view/widgets/check_out_cart.dart';
import 'package:fashionstown/features/cart/presentation/view/widgets/list_cart.dart';
import 'package:fashionstown/features/cart/presentation/view/widgets/show_bottom_sheet_order.dart';
import 'package:fashionstown/features/settings/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCartProduct extends StatefulWidget {
  const ListCartProduct({super.key});

  @override
  State<ListCartProduct> createState() => _ListCartProductState();
}

class _ListCartProductState extends State<ListCartProduct> {
  double totalPrice = 0;
  int listNumber = 0;
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    final userCubit = BlocProvider.of<UserCubit>(context);

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
                      listNumber = index;
                      // print(totalCart);
                      return CustomListCart(
                        productCategory:
                            "${state.cartProducts[index].productCategory}",
                        productId: "${state.cartProducts[index].productId}",
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
                                    (state.cartProducts[index].productCount ??
                                            1) -
                                        1);
                            cartCubit.getCartData();
                          });
                        },
                        onPressedIncrease: () {
                          setState(() {
                            cartCubit.controlTheNumberOfItem(
                                productId:
                                    "${state.cartProducts[index].productId}",
                                valueButton:
                                    (state.cartProducts[index].productCount ??
                                            1) +
                                        1);
                            cartCubit.getCartData();
                          });
                        },
                      );
                    }),
              ),
              OrderNow(
                  onPressed: () {
                    userCubit.checkUserPhoneAdress();

                    if (userCubit.checkUserPhoneAdress() == false) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: errorColor,
                          content: Text(
                            'Please Enter your adress or Phone',
                            style: TextStyles.textStyle14
                                .copyWith(color: textButtonAndMassage),
                          )));
                    } else {
                      ShowBottomSheetOrder().showBottomSheetOrder(context,totalPrice.toString(),
                      onPressed: () {
                     
                     setState(() {
                     for (var i = 0; i < state.cartProducts.length; i++) {
                       BlocProvider.of<OrderCubit>(context).addOrder(
                        userId: "${userCubit.userInfo[0].userId}",
                        productId: "${state.cartProducts[i].productId}", productName: "${state.cartProducts[i].productName}",
                         productImage: "${state.cartProducts[i].productImage}", productPrice: "${state.cartProducts[i].productPrice}",
                          productCategory: "${state.cartProducts[i].productCategory}", productCount: state.cartProducts[i].productCount ?? 1,
                          adress: '${userCubit.userInfo[0].adress}',
                           deliveryDuration:'2 : 5 days' ,
                           historyOrder: DateTime.now(),
                          );
                      }
                     
                      }
                     );
                      }
                      );
                    }
                  },
                  totalCart: totalPrice),
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
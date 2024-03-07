import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/settings/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/custom_order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return   BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is GetOrderProductSuccess) {
            return ListView.builder(
              itemCount: state.orderList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomOrderList(
                    deliveryDuration:  "${state.orderList[index].deliveryDuration}",
                    historyOrder: state.orderList[index].historyOrder,
                    adressDelivery: "${state.orderList[index].adress}" ,
                    productQt: "${state.orderList[index].productCount}",
                    prodctImage: "${state.orderList[index].productImage}",
                    prodctName: "${state.orderList[index].productName}",
                    productPrice: "${state.orderList[index].productPrice}",
                  ),
                );
              },
            );
          } else if (state is FieldGetOrderProductData) {
            return Text(state.massage);
          } else {
            return ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 1,
                      child: const LoadingShimmer());
                });
          }
        },
      );
  }
}
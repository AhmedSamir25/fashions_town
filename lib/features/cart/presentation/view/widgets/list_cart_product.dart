import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_list_products.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCartProduct extends StatelessWidget {
  const ListCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    //final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartProductSuccess) {
        return ListView.builder(
            itemCount: state.cartProducts.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CustomListProducts(
                  networkImage:
                      //searchedproducts
                      "${state.cartProducts[index].productImage}",
                  productName: "${state.cartProducts[index].productName}",
                  productPrice:
                      "${state.cartProducts[index].productPrice}\$");
            });  
        }else if(state is FieldGetCartProductData){
          return Text(state.massage,style: TextStyles.textStyle16,);
        }
        else{
           
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              itemBuilder:(context, index) {
                return  SizedBox(
                            height: MediaQuery.of(context).size.height*0.18,
                      width: MediaQuery.of(context).size.width*1,
                  child: const LoadingShimmer());
              }, );
        
  }
      },
    );
  }
}

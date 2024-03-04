import 'package:fashionstown/features/home_details/presentation/manager/cubit/product_details_cubit.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/app_bar_home_details.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/custom_material_button.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/home_details_image.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/product_info_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsBody extends StatefulWidget {
  const HomeDetailsBody({super.key});

  @override
  State<HomeDetailsBody> createState() => _HomeDetailsBodyState();
}

class _HomeDetailsBodyState extends State<HomeDetailsBody> {
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height ;
    return   BlocBuilder<ProductDetailsCubit ,ProductDetailsState >(
      builder: (context, state) {
        if(state is GetProductDetailSuccess){
        return  Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                const AppBarHomeDetails(),
                SizedBox(height: heightMedia* 0.004,),
                SizedBox(
                  height: heightMedia * 0.71,
                  child: ListView(
                    children: [
                      HomeDetailsImage(imageUrl: '${state.productInfo[0].productImage}',),
                  SizedBox(height: heightMedia * 0.024,),
                  ProductInfoDetails(
                      productPrice:'${state.productInfo[0].productPrice}' ,
                    productDescription:'${state.productInfo[0].productDescription}',
                    productName: '${state.productInfo[0].productName}',
                    productAverageRate: '${state.productInfo[0].productAverageRate}',
                    productRating: '${state.productInfo[0].productRating}',
                    productCategory: '${state.productInfo[0].productCategory}',
                    productId: '${state.productInfo[0].productId}',
                    productImage: '${state.productInfo[0].productImage}',
                    ),
                    ],
                  ),
                ),
                SizedBox(height: heightMedia* 0.1,),
                 CustomMaterialButton(
                  productCategory:'${state.productInfo[0].productCategory}' ,
                  productCount: 1,
                  productId: '${state.productInfo[0].productId}',
                  productImage: '${state.productInfo[0].productImage}',
                  productName: '${state.productInfo[0].productName}',
                  productPrice:'${state.productInfo[0].productPrice}' ,
                ),
              ],
            ),
          ),
        );
        }else{
          return const Text('');
        }
      },

    );
  }
}

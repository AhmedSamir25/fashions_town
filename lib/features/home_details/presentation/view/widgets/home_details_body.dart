import 'package:fashionstown/features/home_details/presentation/manager/cubit/product_details_cubit.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/app_bar_home_details.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/custom_material_button.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/home_details_image.dart';
import 'package:fashionstown/features/home_details/presentation/view/widgets/product_info_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsBody extends StatelessWidget {
  const HomeDetailsBody({super.key});

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
                SizedBox(height: heightMedia* 0.02,),
                HomeDetailsImage(imageUrl: '${state.productInfo[0].productImage}',),
                SizedBox(height: MediaQuery.of(context).size.height * 0.024,),
                ProductInfoDetails(
                    productPrice:'${state.productInfo[0].productPrice}' ,
                  productDescription:'${state.productInfo[0].productDescription}',
                  productName: '${state.productInfo[0].productName}',
                  productAverageRate: '${state.productInfo[0].productAverageRate}',
                  productRating: '${state.productInfo[0].productRating}',
                  ),
                SizedBox(height: heightMedia* 0.27,),

                const CustomMaterialButton(),
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

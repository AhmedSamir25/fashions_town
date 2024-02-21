import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_list_products.dart';
import 'package:fashionstown/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSearchedProducts extends StatelessWidget {
  const ListSearchedProducts({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: searchCubit.searchProducts.isEmpty
              ? 1
              : searchCubit.searchProducts.length,
          itemBuilder: (context, index) {
            if (searchCubit.searchProducts.isEmpty) {
              return AspectRatio(
                aspectRatio: 1/1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsManager.notAvailable,
                      width: MediaQuery.of(context).size.width*0.6,
                      height: MediaQuery.of(context).size.height*0.23,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "This product is currently not available",
                        style: TextStyles.textStyle16,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return CustomListProducts(
                  networkImage:
                      "${searchCubit.searchProducts[index].productImage}",
                  productName:
                      "${searchCubit.searchProducts[index].productName}",
                  productPrice:
                      "${searchCubit.searchProducts[index].productPrice}");
            }
          }),
    );
  }
}

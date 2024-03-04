import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_list_products.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListShowCategory extends StatelessWidget {
  const ListShowCategory({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetProductDataSuccess) {
          return Expanded(
            child: ListView.builder(
                itemCount: productCubit.productsCategory.isEmpty
                    ? 1
                    : productCubit.productsCategory.length,
                itemBuilder: (context, index) {
                  if (productCubit.productsCategory.isEmpty) {
                    return Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "There are no products in the Category",
                          style: TextStyles.textStyle16,
                        ));
                  } else {
                    return CustomListProducts(
                      productCategory: "${productCubit.productsCategory[index].productCategory}",
                      productId: "${productCubit.productsCategory[index].productId}",
                        networkImage:
                            "${productCubit.productsCategory[index].productImage}",
                        productName:
                            "${productCubit.productsCategory[index].productName}",
                        productPrice:
                            "${productCubit.productsCategory[index].productPrice}");
                  }
                }),
          );
        } else if (state is FieldGetProductData) {
          return Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                state.massage,
                style: TextStyles.textStyle16,
              ));
        } else {
          return Expanded(
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.18,
                      child: const LoadingShimmer());
                }),
          );
        }
      },
    );
  }
}
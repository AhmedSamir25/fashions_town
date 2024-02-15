import 'package:fashionstown/core/utils/widgets/custom_list_products.dart';
import 'package:fashionstown/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTest extends StatelessWidget {
  const ListTest({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: searchCubit.streamSearchProducts.length,
          itemBuilder: (context, index) {
            return CustomListProducts(
                networkImage:
                //searchedproducts
                    "${ searchCubit.streamSearchProducts[index].productImage}",
                productName: "${searchCubit.streamSearchProducts[index].productName}",
                productPrice:
                    "${searchCubit.streamSearchProducts[index].productPrice}\$");
          }),
    );
  }
}
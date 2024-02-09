import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_list_products.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSearchProducts extends StatelessWidget {
  const ListSearchProducts({super.key,});
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(
            child: ListView.builder(
                itemCount: searchCubit.searchproducts.isEmpty
                    ? 1
                    : searchCubit.searchproducts.length,
                itemBuilder: (context, index) {
                  if (searchCubit.searchproducts.isEmpty) {
                    return Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "This product is currently not available",
                          style: TextStyles.textStyle16,
                        ));
                  } else {
                    return CustomListProducts(
                        networkImage:
                            "${searchCubit.searchproducts[index].productImage}",
                        productName:
                            "${searchCubit.searchproducts[index].productName}",
                        productPrice:
                            "${searchCubit.searchproducts[index].productPrice}");
                  }
                }),
          );
        } else if (state is FieldSearch) {
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
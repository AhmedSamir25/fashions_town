import 'package:fashionstown/core/utils/widgets/custom_list_products.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/settings/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is GetFavoriteProductSuccess) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.favoriteList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomListProducts(
                      productCategory:"${state.favoriteList[index].productCategory}" ,
                      productId: "${state.favoriteList[index].productId}",
                      networkImage: "${state.favoriteList[index].productImage}",
                      productName: "${state.favoriteList[index].productName}",
                      productPrice: "${state.favoriteList[index].productPrice}",
                    ),
                  );
                },
              ),
            );
          } else if (state is FieldGetFavoriteProductData) {
            return Text(state.massage);
          } else {
            return Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 1,
                        child: const LoadingShimmer());
                  }),
            );
          }
        },
      ),
    );
  }
}

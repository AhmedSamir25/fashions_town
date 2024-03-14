import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/utils/widgets/custom_button_icon.dart';
import 'package:fashionstown/features/settings/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddFavoriteButton extends StatelessWidget {
  const AddFavoriteButton({super.key, required this.productId, required this.productName, required this.productImage, required this.productPrice, required this.productCategory});
final String productId, productName, productImage, productPrice , productCategory ;

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
          return CusttomIconButton(
            colorIcon: favoriteCubit.isProductsInFavorite(
                    productId:productId)
                ? addFavoriteColor
                : textButtonAndMassage,
            onPressed: () {
              favoriteCubit.addFavorite(
                productId: productId,
                productName: productName,
                productImage: productImage,
                productPrice: productPrice,
                productCategory:productCategory,
              );
              favoriteCubit.getFavoriteData();
              favoriteCubit.isProductsInFavorite(
                  productId: productId);
            },
            icon: favoriteCubit.isProductsInFavorite(
                    productId: productId)
                ? const Icon(FontAwesomeIcons.solidHeart)
                : const Icon(FontAwesomeIcons.heart),
          );
      },
    );
  }
}
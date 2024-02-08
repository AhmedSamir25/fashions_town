import 'package:card_swiper/card_swiper.dart';
import 'package:fashionstown/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerSwipList extends StatelessWidget {
  const BannerSwipList({super.key, required this.heightMedia});
  final double heightMedia;
  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context)..getBannersData();
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SizedBox(
          height: heightMedia,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Swiper(
              itemBuilder: (BuildContext context,  index) {
                return  Image.network(
                  "${productCubit.banners[index]["bannerImage"]}",
                  fit: BoxFit.fill,
                );
              },
              itemCount: productCubit.banners.length,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
              ),
              autoplay: true,
              duration: 10,
            ),
          ),
        );
      },
    );
  }
}

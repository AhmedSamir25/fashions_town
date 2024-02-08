import 'package:card_swiper/card_swiper.dart';
import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:flutter/material.dart';

class BannerSwipList extends StatelessWidget {
  const BannerSwipList({super.key, required this.heightMedia});
  final double heightMedia;
  @override
  Widget build(BuildContext context) {
    final List<String> bannersImages = [
      AssetsManager.banner1,
      AssetsManager.banner2,
      AssetsManager.banner3,
      AssetsManager.banner4,
    ];
    return SizedBox(
      height: heightMedia,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              bannersImages[index],
              fit: BoxFit.fill,
             
            );
          },
          itemCount: bannersImages.length,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
          ),
          autoplay: true,
          duration: 10,
        ),
      ),
    );
  }
}
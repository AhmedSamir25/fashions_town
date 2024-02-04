import 'package:fashionstown/features/home/presentation/view/widgets/banner_swip_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double heightMedia = MediaQuery.of(context).size.height;
    final double widthMedia = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            BannerSwipList(heightMedia: heightMedia*0.24)
          ],
        ),
      ),
    );
  }
}
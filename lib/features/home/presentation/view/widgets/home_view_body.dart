import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/banner_swip_list.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/category_item_grid.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/lates_arrival_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double heightMedia = MediaQuery.of(context).size.height;
    //final double widthMedia = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 24,right: 16,left: 16),
        child: Column(
          children: [
            const CustomAppBar(),
            SizedBox(height: heightMedia*0.02,),
            BannerSwipList(heightMedia: heightMedia*0.24),
            SizedBox(height: heightMedia*0.06,),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Lates arrival',style: TextStyles.textStyle18,)),
               SizedBox(height: heightMedia*0.02,),
              SizedBox(
                height: heightMedia*0.20,
                child: const LatesArrivalList()),
                const CategoryItemGrid(),
          ],
        ),
      ),
    );
  }
}

import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/assets_manager.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/custom_button_icon.dart';
import 'package:flutter/material.dart';

class LatesArrivalList extends StatelessWidget {
  const LatesArrivalList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bannersImages = [
      AssetsManager.banner1,
      AssetsManager.banner2,
      AssetsManager.banner3,
      AssetsManager.banner4,
    ];
        final List<String> bannersText = [
      'ship ship ship ship','card card card card card', 'mastre', 'phone'
    ];
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[100],
            ),
            child: Row(
              children: [
                 Column(
                  children: [
                    const Spacer(flex: 1,),
                    Container(
                    constraints: BoxConstraints(maxWidth: 80),
                    child: Text(bannersText[index],
                    style: TextStyles.textStyle14.copyWith(fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    ),
                    ),
                    const Spacer(flex: 4,),
                    Row(
                      children: [
                        CusttomIconButton(onPressed: () {
                          
                        },
                        icon: Icon(Icons.heart_broken_sharp),
                        ),
                        CusttomIconButton(onPressed: (){

                        },
                         icon: Icon(Icons.add_shopping_cart),)
                      ],
                    ),
                    
                    Text('2102',style: TextStyles.textStyle18),
                    const Spacer(flex: 1,),
                  ],
                ),
                SizedBox(width: 10,),
                Container(
                  width: 110,
                  height: 170,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: AssetImage(bannersImages[index],),fit: BoxFit.fill)
                  ),
                  ),
              ],
            ),
          ),
        );
      },
      itemCount: bannersImages.length,
      scrollDirection: Axis.horizontal,

    );
  }
}
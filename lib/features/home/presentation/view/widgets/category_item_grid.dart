import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/list_category_colors.dart';
import 'package:fashionstown/features/home/data/category_item_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryItemGrid extends StatelessWidget {
  const CategoryItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final double heightMedia = MediaQuery.of(context).size.height;
    final double widthMedia = MediaQuery.of(context).size.width;
    return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        children:
            List.generate(CategoryItemData.categoriesList.length, (index) {
          return GestureDetector(
            onTap: () {
                   GoRouter.of(context).push(
                    AppRouter.showCategoryItems,
                    extra:CategoryItemData.categoriesList[index].id,
                   );
                },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: widthMedia * 0.1,
                height: heightMedia * 0.1,
                decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      CategoryItemData.categoriesList[index].image,
                      width: widthMedia * 0.13,
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
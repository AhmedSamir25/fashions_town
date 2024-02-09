import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/list_show_categoty.dart';
import 'package:flutter/material.dart';


class ShowCategoryItems extends StatelessWidget {
  const ShowCategoryItems({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
           padding: const EdgeInsets.only(top: 24.0,left: 10,right: 10),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    Text("Category: $categoryName",style: TextStyles.textStyle18,),
                    SizedBox(height: MediaQuery.of(context).size.height*0.012,),
                    ListShowCategory(categoryName: categoryName,)
            ],
           ),
        ),
      )
    );
  }
}

import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/custom_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatesArrivalList extends StatelessWidget {
  const LatesArrivalList({super.key});
  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
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
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 80),
                          // Name
                          child: Text(
                            "${productCubit.products[index].productName}",
                            style: TextStyles.textStyle14
                                .copyWith(fontWeight: FontWeight.w500),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        Row(
                          children: [
                            CusttomIconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.heart_broken_sharp),
                            ),
                            CusttomIconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_shopping_cart),
                            )
                          ],
                        ),
                        Text("${productCubit.products[index].productPrice}\$", style: TextStyles.textStyle18),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 110,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage("${productCubit.products[index].productImage}"),
                              fit: BoxFit.fill)),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: productCubit.products.length ,
          scrollDirection: Axis.horizontal,
        );
      },
    );
  }
}

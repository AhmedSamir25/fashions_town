import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/home/data/model/product_model.dart';
import 'package:fashionstown/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:fashionstown/features/search/presentation/view/widgets/list_search_products.dart';
import 'package:fashionstown/features/search/presentation/view/widgets/search_loading.dart';
import 'package:fashionstown/features/search/presentation/view/widgets/search_text_field.dart';
import 'package:fashionstown/features/search/presentation/view/widgets/list_search_products_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchText;
  @override
  void initState() {
    searchText = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final search = BlocProvider.of<SearchCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 75),
      child: Column(
        children: [
           SearchTextField(
                        controller: searchText,
                        onChanged: (searchText) {
                          setState(() {
                            BlocProvider.of<SearchCubit>(context)
                                .getSearchProduct(productName: searchText);
                          });
                        },
                      ),
          Expanded(
            child: StreamBuilder<List<ProductModel>>(
                stream: search.fetchProductsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  const SearchLoading();
                  } else if (snapshot.hasError) {
                    Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          snapshot.error.toString(),
                          style: TextStyles.textStyle16,
                        ));
                  } else if (snapshot.data == null) {
                    Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "No Data Now",
                          style: TextStyles.textStyle16,
                        ),
                        );
                  }else if(searchText.text.isEmpty){
                   return  const ListProductSearch();
                  }
                  return const ListSearchedProducts();
                }),
          ),
        ],
      ),
    );
  }
}
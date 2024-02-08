import 'package:fashionstown/features/search/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 70),
      child:  Column(
        children: [
          SearchTextField(),
        ],
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomOrderList extends StatelessWidget {
  const CustomOrderList({super.key, required this.deliveryDuration, required this.historyOrder, required this.adressDelivery, required this.productQt, required this.productPrice, required this.prodctName, required this.prodctImage});
  final String deliveryDuration,  adressDelivery, productQt, productPrice, prodctName, prodctImage;
  final Timestamp historyOrder;
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;  
    var totalPrice = double.parse(productPrice) * int.parse(productQt);
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
      child: Container(
        width:  widthMedia* 0.9,
        height: heightMedia * 0.37,
        decoration: BoxDecoration(
                       color: SaveThemeMode().getTheme() ? backgroundColorItemDark : backgroundColorItemLight, 
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 4),
              width: widthMedia* 0.35,
              height: heightMedia * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image:NetworkImage(prodctImage),fit: BoxFit.fill)
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.45),
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(prodctName,style: TextStyles.textStyle16,overflow: TextOverflow.clip,maxLines: 2,),
                  Text("Qt: $productQt",style: TextStyles.textStyle16),
                  Text("Price: ${totalPrice.toString()}",style: TextStyles.textStyle16),
                  Text("history order:",style: TextStyles.textStyle16),
                  Text(DateFormat.yMEd().format(historyOrder.toDate()),style: TextStyles.textStyle16),
                  Text("delivery duration:",style: TextStyles.textStyle16),
                  Text(deliveryDuration,style: TextStyles.textStyle16),
                  Text("adress delivery:",style: TextStyles.textStyle16),
                  Text(adressDelivery,style: TextStyles.textStyle16),
                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
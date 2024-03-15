import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_elevated_button.dart';
import 'package:fashionstown/features/settings/presentation/manager/user_cubit/user_cubit.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/add_adress_phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddAdress extends StatelessWidget {
  const AddAdress({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    double hightMedia = MediaQuery.of(context).size.height; 
    String userAdress = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your adress'),
      ),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UpdateUserAdressSuccess) {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor, content: Text('update your adress done',style: TextStyles.textStyle14.copyWith(color: textButtonAndMassage),)));
            userCubit.getUserData();
            GoRouter.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: hightMedia * 0.2,
              ),
              AddAdressPhoneTextField(
                onFieldSubmitted: (value) {
                  if (value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor,
               content: Text('Please Enter your adress',style: TextStyles.textStyle14.copyWith(color: textButtonAndMassage),)));
                  }else{
                  userCubit.updateUserAdress(adress: value);
                }},
                labelText: 'Enter your adress',
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  userAdress = value;
                },
              ),
              SizedBox(height:hightMedia * 0.05 ,),
              CustomElevatedButton(textButton: 'Update adress',
               style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(appColor)
               ),
               onPressed: (){
                  if (userAdress.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor,
               content: Text('Please Enter your adress',style: TextStyles.textStyle14.copyWith(color: textButtonAndMassage),)));
                               
                  }else{
                  userCubit.updateUserAdress(adress: userAdress);
                  }
               })
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_elevated_button.dart';
import 'package:fashionstown/features/settings/presentation/manager/user_cubit/user_cubit.dart';
import 'package:fashionstown/features/settings/presentation/view/widgets/add_adress_phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddPhoneView extends StatelessWidget {
  const AddPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    double hightMedia = MediaQuery.of(context).size.height; 
    String phoneNumber = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your Phone'),
      ),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UpdateUserPhoneSuccess) {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor, content: Text('update your phone done',style: TextStyles.textStyle14.copyWith(color: textButtonAndMassage),)));
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
               content: Text('Please Enter your Phone',style: TextStyles.textStyle14.copyWith(color: textButtonAndMassage),)));
                  }else{
                  userCubit.updateUserPhoneNumber(phoneNumber: int.parse(value));
                }},
                labelText: 'Enter your phone',
                keyboardType: TextInputType.number,
              
                onChanged: (value) {
                    phoneNumber = value;},
              ),
              SizedBox(height:hightMedia * 0.05 ,),
              CustomElevatedButton(textButton: 'Update Phone',
               style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(appColor)
               ),
               onPressed: (){
                  if (phoneNumber.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: errorColor,
               content: Text('Please Enter your Phone',style: TextStyles.textStyle14.copyWith(color: textButtonAndMassage),)));
                               
                  }else{
                  userCubit.updateUserPhoneNumber(phoneNumber: int.parse(phoneNumber));
                  userCubit.getUserData();
                  }
               })
            ],
          ),
        ),
      ),
    );
  }
}
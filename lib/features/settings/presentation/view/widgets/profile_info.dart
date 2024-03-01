import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/settings/presentation/manager/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is SuccessGetUserData) {
                    
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage(AssetsManager.photoProfile) ,
            radius: 40,),
            SizedBox(width:MediaQuery.of(context).size.width*0.03,),
            Column(
              children: [
                Text("${state.userInfo[0].name}",
                style:TextStyles.textStyle18 ,),
                SizedBox(width:MediaQuery.of(context).size.height*0.03,),
                Text("${state.userInfo[0].email}",
                style:TextStyles.textStyle14,),
              ],
            ),
          ],
        );  
        }else if (state is FieldGetUserData){
          return Text(state.massage);
        }else{
          return  Column(
            children: [
               CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: SizedBox(
                                   height:MediaQuery.of(context).size.height*0.5,
                 width: MediaQuery.of(context).size.width*0.5,
                  child: const LoadingShimmer()),
              ),
               SizedBox(
                 height:MediaQuery.of(context).size.height*0.1,
                 width: MediaQuery.of(context).size.width*0.9,
                child: const LoadingShimmer()),
            ],
          );
        }
        
      },
    );
  }
}

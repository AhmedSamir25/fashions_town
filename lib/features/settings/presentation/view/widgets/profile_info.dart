import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:fashionstown/features/settings/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is SuccessGetUserData) {
                    
        return  Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(AssetsManager.photoProfile) ,
            radius: 27,),
            SizedBox(width:MediaQuery.of(context).size.width*0.03,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${state.userInfo[0].name}",
                style:TextStyles.textStyle16 ,),
                SizedBox(width:MediaQuery.of(context).size.height*0.03,),
                Text("${state.userInfo[0].email}",
                style:TextStyles.textStyle14 ,),
              ],
            ),
          ],
        );  
        }else if (state is FieldGetUserData){
          return Text(state.massage);
        }else{
          return  Row(
            children: [
               CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                child: SizedBox(
                                   height:MediaQuery.of(context).size.height*0.4,
                 width: MediaQuery.of(context).size.width*0.4,
                  child: const LoadingShimmer()),
              ),
               SizedBox(
                 height:MediaQuery.of(context).size.height*0.09,
                 width: MediaQuery.of(context).size.width*0.7,
                child: const LoadingShimmer()),
            ],
          );
        }
        
      },
    );
  }
}

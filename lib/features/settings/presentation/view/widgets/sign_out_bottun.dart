import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/utils/widgets/custom_elevated_button.dart';
import 'package:fashionstown/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});
  @override
  Widget build(BuildContext context) {
    final signOutCubit = BlocProvider.of<AuthCubit>(context);
    return  CustomElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(errorColor),
      ),
      textButton: 'Sign Out',
      onPressed: (){
        signOutCubit.signOut();
      },
    );
  }
}
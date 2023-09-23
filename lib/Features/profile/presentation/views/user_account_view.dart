import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/profile/presentation/manager/cubits/cubit/user_account_cubit.dart';
import 'package:photoplay/Features/profile/presentation/widgets/account_viw_body.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';

class UserAccountView extends StatelessWidget {
  const UserAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAccountCubit, UserAccountState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccessState) {
          GoRouter.of(context).pop();
          showCustomSnackBar(
            context: context,
            content: state.successMessaege,
            backgroundColor: kPrimatyColor,
            textColor: Colors.black,
          );
        } else if (state is UpdateUserDataFailureState) {
          showCustomSnackBar(
            context: context,
            content: state.errMessage,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: AccountViewBody(isLoading: state is UpdateUserDataLoadingState),
        );
      },
    );
  }
}

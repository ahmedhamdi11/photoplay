import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/reset_password_view_body.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {
          if (state is ResetPasswordFailureState) {
            showCustomSnackBar(
              context: context,
              content: state.errMessage,
              backgroundColor: Colors.red,
            );
          } else if (state is ResetPasswordSuccessState) {
            showCustomSnackBar(
              context: context,
              content: state.successMessage,
              backgroundColor: Colors.green,
            );
          }
        },
        builder: (context, state) {
          return ResetPasswordViewBody(state: state);
        },
      ),
    );
  }
}

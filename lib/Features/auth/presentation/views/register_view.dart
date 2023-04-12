import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/utils/app_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterFailureState) {
            showCustomSnackBar(
                context: context,
                content: state.errMessage,
                backgroundColor: Colors.red);
          } else if (state is RegisterSuccessState) {
            GoRouter.of(context).pushReplacement(AppRouter.homeViewPath);
            showCustomSnackBar(
                context: context,
                content: 'welcom to photoplay',
                textColor: Colors.black,
                backgroundColor: kPrimatyColor);
          }
        },
        builder: (context, state) {
          return RegisterViewBody(
            state: state,
          );
        },
      ),
    );
  }
}

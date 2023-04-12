import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/utils/app_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginFailureState) {
            showCustomSnackBar(
              context: context,
              content: state.errMessage,
              backgroundColor: Colors.red,
            );
          } else if (state is LoginSuccessState) {
            GoRouter.of(context).pushReplacement(AppRouter.homeViewPath);
            showCustomSnackBar(
                context: context,
                content: 'welcom back my friend',
                textColor: Colors.black,
                backgroundColor: kPrimatyColor);
          }
        },
        builder: (context, state) {
          return LoginViewBody(
            state: state,
          );
        },
      ),
    );
  }
}

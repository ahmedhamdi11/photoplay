import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/cubit/register_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';

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

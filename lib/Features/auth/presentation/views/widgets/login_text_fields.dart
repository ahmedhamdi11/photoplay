import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/text_field_title.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    super.key,
    required this.loginCubit,
  });

  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextFieldTitle(title: 'EMAIL'),
        CustomTextField(
          hint: 'email here',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'email cannot be empty';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            loginCubit.email = value;
          },
        ),
        const SizedBox(
          height: 25.0,
        ),

        //password field
        const TextFieldTitle(title: 'PASSWORD'),
        CustomTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'password cannot be empty';
            } else {
              return null;
            }
          },
          hint: 'password here',
          isPassword: true,
          onChanged: (value) {
            loginCubit.password = value;
          },
          suffix: TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.resetPasswordViewPath);
            },
            child: Text(
              'FORGOT?',
              style: Styles.text11,
            ),
          ),
        ),
      ],
    );
  }
}

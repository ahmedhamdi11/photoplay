import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/login_background.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/app_logo.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/social_logins.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key, required this.state});
  final LoginStates state;
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
    return Stack(
      children: [
        //background image
        const LoginBackground(),

        //main body
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              children: [
                //logo
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 50,
                ),

                //email field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'EMAIL',
                    style: Styles.text12b,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  hint: 'email here',
                  onChanged: (value) {
                    loginCubit.email = value;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),

                //password field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PASSWORD',
                    style: Styles.text12b,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  hint: 'password here',
                  onChanged: (value) {
                    loginCubit.password = value;
                  },
                  suffix: TextButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .push(AppRouter.resetPasswordViewPath);
                    },
                    child: Text(
                      'FORGOT?',
                      style: Styles.text11,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 21.0,
                ),

                //login button
                state is LoginLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : DefaultButton(
                        onPressed: () {
                          loginCubit.loginUser();
                        },
                        btnText: 'LOGIN',
                      ),
                const SizedBox(
                  height: 29.0,
                ),

                //login with facebook and googl
                const SocialLogins(),
                const SizedBox(
                  height: 42.0,
                ),

                //register button
                Text(
                  'Don\'t have an account?',
                  style: Styles.text14m.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withAlpha(70),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.registerViewPath);
                  },
                  child: Text(
                    'REGISTER',
                    style: Styles.text14b,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/login_background.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/app_logo.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/login_text_fields.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/social_logins.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key, required this.state});
  final LoginStates state;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
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

                  //text fields(email,password)
                  LoginTextFields(loginCubit: loginCubit),
                  const SizedBox(
                    height: 21.0,
                  ),

                  //login button
                  widget.state is LoginLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : DefaultButton(
                          onPressed: () {
                            loginUser(loginCubit);
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

                  TextButton(
                    onPressed: () {
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
        ),
      ],
    );
  }

  void loginUser(LoginCubit loginCubit) {
    if (formKey.currentState!.validate()) {
      loginCubit.loginUser();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

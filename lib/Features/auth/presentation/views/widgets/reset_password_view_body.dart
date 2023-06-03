import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/app_logo.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.state});
  final ResetPasswordStates state;

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
    return SafeArea(
      child: Column(
        children: [
          const DefaultBackBtn(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      const AppLogo(),
                      const SizedBox(height: 38.0),
                      Text(
                        'FORGOT PASSWORD?',
                        style: Styles.text12b.copyWith(fontSize: 13),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Enter the email address you used to create your account and we will email you a link to reset your password',
                        style: isDarkTheme
                            ? Styles.text15bk
                            : Styles.text15bk.copyWith(
                                color: const Color(0xff7E7E7E),
                              ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'EMAIL',
                          style: Styles.text12b,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      CustomTextField(
                        hint: 'email here',
                        onChanged: (value) {
                          BlocProvider.of<ResetPasswordCubit>(context).email =
                              value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                      widget.state is ResetPasswordLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : DefaultButton(
                              onPressed: () {
                                resetPassword(formKey, context);
                              },
                              btnText: 'SEND EMAIL',
                            ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void resetPassword(GlobalKey<FormState> formKey, BuildContext context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<ResetPasswordCubit>(context)
          .resetPassword()
          .then((value) {
        GoRouter.of(context).pop();
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}

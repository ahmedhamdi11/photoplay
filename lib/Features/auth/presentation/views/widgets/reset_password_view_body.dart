import 'package:flutter/material.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/app_logo.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const DefaultBackBtn(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                    ),
                    const AppLogo(),
                    const SizedBox(
                      height: 38.0,
                    ),
                    Text(
                      'FORGOT PASSWORD?',
                      style: Styles.text12b.copyWith(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Enter the email address you used to create your account and we will email you a link to reset your password',
                      style: Styles.text15bk,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 28.0,
                    ),
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
                    const CustomTextField(
                      hint: 'email here',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DefaultButton(onPressed: () {}, btnText: 'SEND EMAIL'),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

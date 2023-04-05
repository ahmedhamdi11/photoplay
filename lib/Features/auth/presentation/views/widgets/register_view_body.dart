import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //back button
          const DefaultBackBtn(),

          //add profile picture
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xff1D1D1D),
            child: SvgPicture.asset('assets/images/person.svg'),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Add profile picture',
            style: Styles.text15m,
          ),
          const SizedBox(
            height: 44.0,
          ),

          ///////////////////////
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Register TextFields
                    Text(
                      'FIRST NAME',
                      style: Styles.text12b,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const CustomTextField(
                      hint: 'first name here',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'LAST NAME',
                      style: Styles.text12b,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const CustomTextField(
                      hint: 'last name here',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'EMAIL',
                      style: Styles.text12b,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const CustomTextField(
                      hint: 'email here',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'PASSWORD',
                      style: Styles.text12b,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const CustomTextField(
                      hint: 'password here',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'CONFIRM PASSWORD',
                      style: Styles.text12b,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const CustomTextField(
                      hint: 'confirm password here',
                    ),
                    const SizedBox(
                      height: 21.0,
                    ),

                    //Register button
                    DefaultButton(
                      onPressed: () {},
                      btnText: 'REGISTER',
                    )
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

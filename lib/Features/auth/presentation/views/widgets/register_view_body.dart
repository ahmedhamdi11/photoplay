import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/cubit/register_cubit.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = BlocProvider.of<RegisterCubit>(context);
    return SafeArea(
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterFailureState) {
            showCustomSnackBar(
                context: context,
                content: state.errMessage,
                backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          return Column(
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
                        CustomTextField(
                          hint: 'first name here',
                          onChanged: (value) {
                            registerCubit.firstName = value;
                          },
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
                        CustomTextField(
                          hint: 'last name here',
                          onChanged: (value) {
                            registerCubit.lastName = value;
                          },
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
                        CustomTextField(
                          hint: 'email here',
                          onChanged: (value) {
                            registerCubit.email = value;
                          },
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
                        CustomTextField(
                          hint: 'password here',
                          onChanged: (value) {
                            registerCubit.password = value;
                          },
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
                        state is RegisterLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : DefaultButton(
                                onPressed: () {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .registerUser(
                                    email: registerCubit.email!,
                                    password: registerCubit.password!,
                                  );
                                },
                                btnText: 'REGISTER',
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

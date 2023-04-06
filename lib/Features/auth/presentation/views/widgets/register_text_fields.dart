import 'package:flutter/material.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/widgets/text_field_title.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';

class RegisterTextFields extends StatelessWidget {
  const RegisterTextFields({
    super.key,
    required this.registerCubit,
  });

  final RegisterCubit registerCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //first name
        const TextFieldTitle(title: 'FIRST NAME'),
        CustomTextField(
          hint: 'first name here',
          keyboardType: TextInputType.name,
          onChanged: (value) {
            registerCubit.firstName = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'please inter your first name';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 25.0,
        ),

        //last name
        const TextFieldTitle(title: 'LAST NAME'),
        CustomTextField(
          hint: 'last name here',
          keyboardType: TextInputType.name,
          onChanged: (value) {
            registerCubit.lastName = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'please inter your last name';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 25.0,
        ),

        //email
        const TextFieldTitle(
          title: 'EMAIL',
        ),
        CustomTextField(
          hint: 'email here',
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            registerCubit.email = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'email cannot be empty';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 25.0,
        ),

        //password
        const TextFieldTitle(title: 'PASSWORD'),
        CustomTextField(
          hint: 'password here',
          onChanged: (value) {
            registerCubit.password = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'password cannot be empty';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 25.0,
        ),

        //confirm password
        const TextFieldTitle(title: 'CONFIRM PASSWORD'),
        CustomTextField(
          hint: 'confirm password here',
          validator: (value) {
            if (value!.isEmpty) {
              return 'confirm your password';
            } else if (value != registerCubit.password) {
              return 'enter the same password';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}

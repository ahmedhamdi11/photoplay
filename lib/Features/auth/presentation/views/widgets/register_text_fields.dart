import 'package:flutter/material.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/cubit/register_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';
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
        const FieldTitle(title: 'FIRST NAME'),
        CustomTextField(
          hint: 'first name here',
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
        const FieldTitle(title: 'LAST NAME'),
        CustomTextField(
          hint: 'last name here',
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
        const FieldTitle(
          title: 'EMAIL',
        ),
        CustomTextField(
          hint: 'email here',
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
        const FieldTitle(title: 'PASSWORD'),
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
        const FieldTitle(title: 'CONFIRM PASSWORD'),
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

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Styles.text12b,
      ),
    );
  }
}

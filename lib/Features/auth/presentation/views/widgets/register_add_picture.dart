import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';

class RegisterAddPicture extends StatefulWidget {
  const RegisterAddPicture({
    super.key,
  });

  @override
  State<RegisterAddPicture> createState() => _RegisterAddPictureState();
}

class _RegisterAddPictureState extends State<RegisterAddPicture> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;

    ImagePicker picker = ImagePicker();
    return Column(
      children: [
        isDarkTheme
            ?
            // circle avatar whit no shadows
            CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xff1D1D1D),
                backgroundImage:
                    imageFile == null ? null : FileImage(imageFile!),
                child: imageFile != null
                    ? null
                    : SvgPicture.asset('assets/images/person.svg'),
              )
            :
            // circle avatar with shadows for the light theme
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        blurRadius: 16.0,
                        spreadRadius: 3)
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      imageFile == null ? null : FileImage(imageFile!),
                  child: imageFile != null
                      ? null
                      : SvgPicture.asset('assets/images/person.svg'),
                ),
              ),

        const SizedBox(
          height: 16.0,
        ),

        // upload image button
        TextButton(
          onPressed: () async {
            XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
            setState(() {
              if (xFile != null) {
                imageFile = File(xFile.path);
              }
              BlocProvider.of<RegisterCubit>(context).imageFile = imageFile;
            });
          },
          child: Text(
            'Add profile picture',
            style: Styles.text15m,
          ),
        ),
      ],
    );
  }
}

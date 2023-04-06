import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
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
    ImagePicker picker = ImagePicker();
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0xff1D1D1D),
          backgroundImage: imageFile == null ? null : FileImage(imageFile!),
          child: imageFile != null
              ? null
              : SvgPicture.asset('assets/images/person.svg'),
        ),
        const SizedBox(
          height: 16.0,
        ),
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

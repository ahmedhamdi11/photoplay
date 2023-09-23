import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.photoUrl,
    this.imageFile,
  });

  final String? photoUrl;
  final File? imageFile;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 72,
      backgroundColor: kPrimatyColor,
      child: photoUrl != null && imageFile == null
          ? CachedNetworkImage(
              imageUrl: photoUrl!,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 70,
                backgroundImage: imageProvider,
              ),
            )
          : CircleAvatar(
              radius: 70,
              backgroundColor: const Color(0xff1D1D1D),
              backgroundImage: imageFile == null ? null : FileImage(imageFile!),
              child: imageFile != null
                  ? null
                  : SvgPicture.asset('assets/images/person.svg'),
            ),
    );
  }
}

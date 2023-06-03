import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/functions/shader_mask_colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
    List<double> shaderStopsList = [0, 0.04, 0.05, 0.91, 0.94, 1];

    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: shaderMaskColors(isDarkTheme),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: shaderStopsList,
        ).createShader(bounds);
      },
      child: Image.asset(
        'assets/images/loginImage.png',
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }
}

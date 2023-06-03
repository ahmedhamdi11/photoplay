import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
    return isDarkTheme
        ? Column(
            children: [
              SvgPicture.asset('assets/images/logo.svg'),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'PHOTOPLAY',
                style: Styles.text16,
              ),
            ],
          )
        : Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: kLightScaffoldColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 16.0,
                ),
              ],
            ),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/logo.svg'),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'PHOTOPLAY',
                  style: Styles.text16,
                ),
              ],
            ),
          );
  }
}

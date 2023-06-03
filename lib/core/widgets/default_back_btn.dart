import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';

class DefaultBackBtn extends StatelessWidget {
  const DefaultBackBtn({
    super.key,
  });

  List<Shadow> backBtnShadows(bool isDarkTheme) {
    return isDarkTheme
        ? [
            const Shadow(
              color: Colors.black,
              offset: Offset(0, 0.5),
              blurRadius: 2,
            ),
          ]
        : [
            const Shadow(
              color: Colors.white,
              offset: Offset(0, 0.5),
              blurRadius: 2,
            ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, state) {
        bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    shadows: backBtnShadows(isDarkTheme),
                    color: isDarkTheme ? kDarkBackBtnColor : kLightBackBtnColor,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'BACK',
                    style: Styles.text14b.copyWith(
                      color:
                          isDarkTheme ? kDarkBackBtnColor : kLightBackBtnColor,
                      shadows: backBtnShadows(isDarkTheme),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

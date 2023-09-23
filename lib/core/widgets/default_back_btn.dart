import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';

class DefaultBackBtn extends StatelessWidget {
  const DefaultBackBtn({
    super.key,
    this.onlyIcon = false,
  });

  final bool onlyIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, state) {
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
                  const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  if (onlyIcon == false)
                    Text(
                      'BACK',
                      style: Styles.text14b,
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

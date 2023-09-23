import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, state) {
        return SizedBox(
          height: 50,
          child: Row(
            children: [
              const DefaultBackBtn(
                onlyIcon: true,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                title,
                style: Styles.text19m,
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/profile/presentation/widgets/change_language_widget.dart';
import 'package:photoplay/Features/profile/presentation/widgets/change_theme_switch.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/widgets/custom_appbar.dart';
import 'package:rive/rive.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late RiveAnimationController _riveAnimationController;

  void toggleAnimation() {
    setState(
      () => BlocProvider.of<ThemeCubit>(context).isDarkTheme
          ? _riveAnimationController = SimpleAnimation('idle')
          : _riveAnimationController = SimpleAnimation('to_dark'),
    );
  }

  void toggleTheme() {
    BlocProvider.of<ThemeCubit>(context).toggleTheme();
    toggleAnimation();
  }

  @override
  void initState() {
    super.initState();
    _riveAnimationController = BlocProvider.of<ThemeCubit>(context).isDarkTheme
        ? SimpleAnimation('to_dark')
        : SimpleAnimation('idle');
  }

  @override
  void dispose() {
    super.dispose();
    _riveAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // go back button
            const CustomAppBar(title: 'Setting'),

            const SizedBox(height: 16),

            // change theme switch tile
            ChangeThemeSwitch(
              value: BlocProvider.of<ThemeCubit>(context).isDarkTheme,
              onChanged: (value) => toggleTheme(),
            ),

            const Divider(indent: 28.0, endIndent: 28.0),

            //change language (drop down menu)
            const ChangeLanguage(),

            // the cute rive animation
            Flexible(
              child: Center(
                child: RiveAnimation.asset(
                  'assets/rive/setting_animation.riv',
                  controllers: [_riveAnimationController],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

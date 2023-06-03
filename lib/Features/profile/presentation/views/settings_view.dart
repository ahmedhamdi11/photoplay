import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/profile/presentation/widgets/change_language_widget.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
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

  @override
  void initState() {
    super.initState();
    _riveAnimationController = BlocProvider.of<ThemeCubit>(context).isDarkTheme
        ? SimpleAnimation('to_dark')
        : SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const DefaultBackBtn(),
            const SizedBox(
              height: 16,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: BlocProvider.of<ThemeCubit>(context).isDarkTheme,
              activeColor: kPrimatyColor,
              onChanged: (value) {
                BlocProvider.of<ThemeCubit>(context).toggleTheme();
                toggleAnimation();
              },
              title: const Text('Dark Theme'),
            ),
            const Divider(),
            const ChangeLanguage(),
            Flexible(
                child: Center(
                    child: RiveAnimation.asset(
              'assets/rive/setting_animation.riv',
              controllers: [_riveAnimationController],
            )))
          ],
        ),
      ),
    ));
  }
}

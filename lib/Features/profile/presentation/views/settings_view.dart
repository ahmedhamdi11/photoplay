import 'package:flutter/material.dart';
import 'package:photoplay/Features/profile/presentation/widgets/change_language_widget.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:rive/rive.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late RiveAnimationController _riveAnimationController;
  bool isDarkThem = true;
  void togglePlay() => setState(() => isDarkThem
      ? _riveAnimationController = SimpleAnimation('to_dark')
      : _riveAnimationController = SimpleAnimation('to_light'));

  @override
  void initState() {
    super.initState();
    _riveAnimationController = SimpleAnimation('to_dark');
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
              value: isDarkThem,
              activeColor: kPrimatyColor,
              onChanged: (value) {
                isDarkThem = !isDarkThem;
                togglePlay();
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

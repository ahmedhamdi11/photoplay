import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';

class ChangeThemeSwitch extends StatelessWidget {
  const ChangeThemeSwitch({
    super.key,
    this.onChanged,
    required this.value,
  });
  final void Function(bool)? onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        value: value,
        activeColor: kPrimatyColor,
        onChanged: onChanged,
        title: const Text('Dark Theme'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key, this.onTap, required this.btnText});
  final void Function()? onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    // i added the Material widget with transparent color
    // so the splash and the highlit of the InWell button can appears
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            child: Text(btnText)),
      ),
    );
  }
}

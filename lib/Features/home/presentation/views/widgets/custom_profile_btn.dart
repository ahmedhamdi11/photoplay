import 'package:flutter/material.dart';
import 'package:photoplay/core/utils/styles.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 8.0),
          height: 45,
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              const SizedBox(
                width: 28.0,
              ),
              Text(
                text,
                style: Styles.text17.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

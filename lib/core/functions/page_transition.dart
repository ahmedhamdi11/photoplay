import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage defaultTransitionPage({
  required LocalKey key,
  Animatable<Offset>? tween,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          tween ?? Tween(begin: const Offset(1, 0), end: Offset.zero),
        ),
        child: child,
      );
    },
  );
}

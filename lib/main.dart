import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/app_router.dart';

void main() {
  runApp(const PhotoPlay());
}

class PhotoPlay extends StatelessWidget {
  const PhotoPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorSchemeSeed: kPrimatyColor,
        // textSelectionTheme: TextSelectionThemeData(
        // selectionColor: kPrimatyColor, selectionHandleColor: kPrimatyColor),
        fontFamily: 'Gotham',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}

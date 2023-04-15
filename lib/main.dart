import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:photoplay/core/utils/cash_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CashHelper.init();
  CashHelper.uId = CashHelper.prefs.getString('uId');
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

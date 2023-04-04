import 'package:flutter/material.dart';
import 'package:photoplay/Features/auth/presentation/views/login_view.dart';

void main() {
  runApp(const PhotoPlay());
}

class PhotoPlay extends StatelessWidget {
  const PhotoPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginView(),
      theme: ThemeData(
        fontFamily: 'Gotham',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/custom_navigation_bar.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

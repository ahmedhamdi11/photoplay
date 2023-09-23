import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/home_cubit/home_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/custom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              homeCubit.views[homeCubit.currentIndex],
              const CustomNavigationBar(),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/get_more_movies_cubit/get_more_movies_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/more_movies_item.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/error_view.dart';

class MoreTopRatedView extends StatefulWidget {
  const MoreTopRatedView({super.key});

  @override
  State<MoreTopRatedView> createState() => _MoreTopRatedView();
}

class _MoreTopRatedView extends State<MoreTopRatedView> {
  ScrollController scrollController = ScrollController();
  int pageNum = 1;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageNum += 1;
        BlocProvider.of<GetMoreMoviesCubit>(context)
            .getMoreTopRated(pageNum: pageNum);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetMoreMoviesCubit cubit = BlocProvider.of<GetMoreMoviesCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appBar
            Container(
              color: BlocProvider.of<ThemeCubit>(context).isDarkTheme
                  ? kDarkNavigationBarColor
                  : kLightNavigationBarColor,
              child: Row(
                children: [
                  const DefaultBackBtn(
                    onlyIcon: true,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    'Top Rated',
                    style: Styles.text19m,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),

            // body (the grid view)
            Expanded(
              child: BlocBuilder<GetMoreMoviesCubit, GetMoreMoviesStates>(
                builder: (context, state) {
                  if (cubit.topRatedMovies.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetMoreMoviesFailureState) {
                    return ErrorView(errMessage: state.errMessage);
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      controller: scrollController,
                      itemCount: cubit.topRatedMovies.length + 1,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (context, index) {
                        if (index < cubit.topRatedMovies.length) {
                          return MoreMoviesItem(
                              movie: cubit.topRatedMovies[index]);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

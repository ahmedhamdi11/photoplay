import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/get_more_movies_cubit/get_more_movies_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/more_movies_item.dart';
import 'package:photoplay/core/widgets/custom_appbar.dart';
import 'package:photoplay/core/widgets/error_view.dart';

class MoreTopRatedView extends StatefulWidget {
  const MoreTopRatedView({super.key});

  @override
  State<MoreTopRatedView> createState() => _MoreTopRatedView();
}

class _MoreTopRatedView extends State<MoreTopRatedView> {
  final ScrollController _scrollController = ScrollController();
  int pageNum = 1;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        pageNum += 1;
        BlocProvider.of<GetMoreMoviesCubit>(context)
            .getMoreTopRated(pageNum: pageNum);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
            const CustomAppBar(
              title: 'Top Rated',
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

                  return CupertinoScrollbar(
                    controller: _scrollController,
                    scrollbarOrientation: ScrollbarOrientation.left,
                    thumbVisibility: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GridView.builder(
                        controller: _scrollController,
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

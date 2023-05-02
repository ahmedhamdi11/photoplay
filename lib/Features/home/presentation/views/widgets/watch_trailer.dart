import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/trailers_cubit/trailers_cubit.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/widgets/default_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailer extends StatelessWidget {
  const WatchTrailer({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    TrailersCubit cubit = BlocProvider.of<TrailersCubit>(context);
    return BlocConsumer<TrailersCubit, TrailersStates>(
      listener: (context, state) {
        if (state is GetMovieTrailerFailureState) {
          showCustomSnackBar(
            context: context,
            content: state.errMessage,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return state is GetMovieTrailerLoadingState
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: 160,
                child: DefaultButton(
                    onPressed: () {
                      BlocProvider.of<TrailersCubit>(context)
                          .getMovieTrailer(movieId: movieId)
                          .then(
                        (value) {
                          if (cubit.trailerVideo?.videoKey != null) {
                            YoutubePlayerController controller =
                                YoutubePlayerController(
                              initialVideoId:
                                  cubit.trailerVideo?.videoKey ?? '',
                              flags: const YoutubePlayerFlags(
                                hideThumbnail: true,
                                showLiveFullscreenButton: false,
                              ),
                            );
                            showDialog(
                              context: context,
                              builder: (context) {
                                return YoutubePlayer(
                                  controller: controller,
                                  progressColors: const ProgressBarColors(
                                    playedColor: kPrimatyColor,
                                    handleColor: kPrimatyColor,
                                  ),
                                );
                              },
                            );
                          }
                        },
                      );
                    },
                    btnText: 'WATCH TRAILER'),
              );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/trailers_cubit/trailers_cubit.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';
import 'package:photoplay/core/widgets/default_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    TrailersCubit cubit = BlocProvider.of<TrailersCubit>(context);

    return BlocConsumer<TrailersCubit, TrailersStates>(
      //bloc listener
      listener: (context, state) {
        //show the errMessage when the state is failure state
        if (state is GetMovieTrailerFailureState) {
          showCustomSnackBar(
            context: context,
            content: state.errMessage,
            backgroundColor: Colors.red,
          );
        }
      },

      //bloc builder
      builder: (context, state) {
        // if the state is loading show loading indicator else show the watch trailer btn
        return state is GetMovieTrailerLoadingState
            ?
            // return loading indicator
            const Center(child: CircularProgressIndicator())
            :
            // else return the button
            SizedBox(
                width: 160,
                child: DefaultButton(
                  onPressed: () {
                    //get the Youtube video id
                    cubit.getMovieTrailer(movieId: movieId).then(
                      (value) {
                        if (cubit.trailerVideo?.videoKey != null) {
                          //initialize the youtube controller
                          YoutubePlayerController controller =
                              initYoutubeContrller(
                                  cubit.trailerVideo!.videoKey);

                          //start playing the youtube video
                          showYoutubeVideo(context, controller);
                        }
                      },
                    );
                  },
                  btnText: 'WATCH TRAILER',
                ),
              );
      },
    );
  }

  //show youtube video fn
  void showYoutubeVideo(
    BuildContext context,
    YoutubePlayerController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return YoutubePlayerBuilder(
          //show the status bar again on exit full screen
          onExitFullScreen: () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: [SystemUiOverlay.top]);
          },
          //player
          player: YoutubePlayer(
            controller: controller,
            progressColors: const ProgressBarColors(
              playedColor: kPrimatyColor,
              handleColor: kPrimatyColor,
            ),
          ),
          //builder
          builder: (context, player) {
            return player;
          },
        );
      },
    );
  }

  //initialize controller fn
  YoutubePlayerController initYoutubeContrller(String videoKey) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoKey,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        loop: true,
      ),
    );
    return controller;
  }
}

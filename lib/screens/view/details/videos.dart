import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socer_project/screens/view_model/movie_cubit/movie_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../view_model/movie_cubit/movie_state.dart';

class VideosScreen extends StatelessWidget {
  dynamic id;

  VideosScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                      itemCount: cubit.videoModel?.results?.length ?? 0,
                      itemBuilder: (context, current) {
                        final YoutubePlayerController controller =
                            YoutubePlayerController(
                          initialVideoId:
                              '${cubit.videoModel?.results?[current].key}', // https://www.youtube.com/watch?v= 19ikl8vy4zs
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                            loop: false,
                            showLiveFullscreenButton: false,

                          ),
                        );
                        return Column(
                          children: [
                            SizedBox(
                              height: 130.h,
                              child: YoutubePlayer(
                                controller: controller,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              child: Text(
                                '${cubit.videoModel?.results?[current].name}',
                                style: TextStyle(
                                  color:
                                      cubit.dark ? Colors.white : Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

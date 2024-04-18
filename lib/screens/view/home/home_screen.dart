import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socer_project/screens/view/home/component/now_playing_screen.dart';
import 'package:socer_project/screens/view/home/component/popular_screen.dart';
import 'package:socer_project/screens/view/home/component/up_coming_screen.dart';
import 'package:socer_project/screens/view_model/movie_cubit/movie_cubit.dart';
import '../../../generated/l10n.dart';
import '../../view_model/movie_cubit/movie_state.dart';
import 'component/home_tabs.dart';
import 'component/top_rated_screen.dart';
import 'component/trending_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = {
      0: const NowPlayingScreen(),
      1: const UpComingScreen(),
      2: const TopRatedScreen(),
    };

    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        final selectedScreen = screens[cubit.index] ?? const PopularScreen();
        return Directionality(
          textDirection: cubit.currentLanguage == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  S.of(context).title,
                  style: TextStyle(
                    color: cubit.dark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      cubit.changeMode();
                    },
                    icon: Icon(
                      Icons.brightness_4_sharp,
                      color: cubit.dark ? Colors.white : Colors.blueGrey,
                    ),
                  ),

                       IconButton(
                        onPressed: () {
                          // NewsCubit.get(context).toggleLanguage();
                          // NewsCubit.get(context).getNews();

                          cubit.toggleLanguage();
                          cubit.changeLang();
                          cubit.getPopular();
                          cubit.getTrend();
                          cubit.getNowPlaying();
                          cubit.getUpComing();
                          cubit.getTopRated();
                        },
                        icon: Icon(
                          Icons.language,
                          color: cubit.dark ? Colors.white : Colors.blueGrey,
                        ),
                      ),

                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ConditionalBuilder(
                            condition:state is GetTrendLoadingState ,
                            builder: (context) => const CircularProgressIndicator(color: Colors.blueGrey,),
                            fallback: (context) => TrendingList(),
                        ),
                        SizedBox(height: 10.h),
                        const HomeTabs(),
                        cubit.index == 0
                            ? const NowPlayingScreen()
                            : cubit.index == 1
                            ? const UpComingScreen()
                            : cubit.index == 2
                            ? const TopRatedScreen()
                            : const PopularScreen()
                        // keep alive
                      ],
                    ),
                  ),
                ),
              ),
          ),
        );
      },
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socer_project/screens/view_model/movie_cubit/movie_cubit.dart';
import 'package:socer_project/screens/view_model/movie_cubit/movie_state.dart';

import 'utils/colors/custom_colors.dart';

class HomeNavPage extends StatelessWidget {
  const HomeNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        return Directionality(
          textDirection: cubit.currentLanguage == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: cubit.dark?CustomColors.primaryButton:Colors.grey.shade400,
              items: cubit.items,
              index: cubit.currentIndex,
              height: 60.h,
              onTap: (currentIndex) => cubit.changeCurrentIndex(
                currentIndex,
              ),
            ),
            body: cubit.layouts[cubit.currentIndex],
          ),
        );
      },
    );
  }
}



abstract class MovieState {}

class SystemInitial extends MovieState {}
class ChangeIndex extends MovieState {}


class ChangeIndexState extends MovieState {}
class ModeSuccess extends MovieState {}
class LanguageChange extends MovieState {}


class GetLiveLoadingState extends MovieState{}
class GetLiveSuccessState extends MovieState{}
class GetLiveErrorState extends MovieState{}

class LoadingGetTopRatedMovieState extends MovieState {}

class SuccessGetTopRatedMovieState extends MovieState {}
class FailedGetTopRatedMovieState extends MovieState {}

class LoadingGetPopularMovieState extends MovieState {}
class SuccessGetPopularMovieState extends MovieState {}
class FailedGetPopularMovieState extends MovieState {}

class LoadingGetNowPlayingState extends MovieState {}
class SuccessGetNowPlayingState extends MovieState {}
class FailedGetNowPlayingState extends MovieState {}

class LoadingGetUpComingState extends MovieState {}
class SuccessGetUpComingState extends MovieState {}
class FailedGetUpComingState extends MovieState {}

class LoadingGetReviewState extends MovieState {}
class SuccessGetReviewState extends MovieState {}
class FailedGetReviewState extends MovieState {}

class GetCastLoadingState extends MovieState {}
class GetCastSuccessState extends MovieState {}
class GetCastErrorState extends MovieState {}

class GetTrendLoadingState extends MovieState {}
class GetTrendSuccessState extends MovieState {}
class GetTrendErrorState extends MovieState {}

class GetGenreLoadingState extends MovieState {}
class GetGenreSuccessState extends MovieState {}
class GetGenreErrorState extends MovieState {}

class GetVideoLoadingState extends MovieState {}
class GetVideoSuccessState extends MovieState {}
class GetVideoErrorState extends MovieState {}

class GetSearchLoadingState extends MovieState {}
class GetSearchSuccessState extends MovieState {}
class GetSearchErrorState extends MovieState {}
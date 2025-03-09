import 'package:get_it/get_it.dart';
import 'package:movie_app/fetures/movie/data/data_source/remmot_data_source.dart';
import 'package:movie_app/fetures/movie/data/repository_impl/movies_repo_impl.dart';
import 'package:movie_app/fetures/movie/domain/repository/movies_repo.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_movie_detail_usecases.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_now_playing_movies.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_popular_movies.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_recommendation_usecas.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_top_rated_movies.dart';
import 'package:movie_app/fetures/movie/presentation/bloc/movie_detail_bloc.dart';
import 'package:movie_app/fetures/movie/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<MoviesRepo>(
        () => MoviesRepoImpl(sl(), baseMovieRemoteDataSource: sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

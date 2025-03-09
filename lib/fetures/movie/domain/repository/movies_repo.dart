// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/fetures/movie/domain/entities/movie.dart';
import 'package:movie_app/fetures/movie/domain/entities/movie_details.dart';
import 'package:movie_app/fetures/movie/domain/entities/recommendation.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_movie_detail_usecases.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_recommendation_usecas.dart';

abstract class MoviesRepo {
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  Future<Either<Failure, List<Movie>>> GetNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> GetPopularMovies();
  Future<Either<Failure, List<Movie>>> GetTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}

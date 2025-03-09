// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exeptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/fetures/movie/data/data_source/remmot_data_source.dart';
import 'package:movie_app/fetures/movie/domain/entities/movie.dart';
import 'package:movie_app/fetures/movie/domain/entities/movie_details.dart';
import 'package:movie_app/fetures/movie/domain/entities/recommendation.dart';
import 'package:movie_app/fetures/movie/domain/repository/movies_repo.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_movie_detail_usecases.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_recommendation_usecas.dart';

class MoviesRepoImpl extends MoviesRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepoImpl(Object object, {required this.baseMovieRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> GetNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> GetPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> GetTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}

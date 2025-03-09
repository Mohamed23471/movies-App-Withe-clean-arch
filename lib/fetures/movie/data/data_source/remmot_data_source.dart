import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exeptions.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error_massage_model.dart';
import 'package:movie_app/fetures/movie/data/models/movie_details_models.dart';
import 'package:movie_app/fetures/movie/data/models/movie_model.dart';
import 'package:movie_app/fetures/movie/data/models/recommendatio_model.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_movie_detail_usecases.dart';
import 'package:movie_app/fetures/movie/domain/use_cases/get_recommendation_usecas.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJosn(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
        errorMassage: null,
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJosn(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
        errorMassage: null,
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJosn(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
        errorMassage: null,
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
        errorMassage: null,
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map(
        (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
        errorMassage: null,
      );
    }
  }
}

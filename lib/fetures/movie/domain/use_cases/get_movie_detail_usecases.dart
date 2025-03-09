import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/fetures/movie/domain/entities/movie_details.dart';
import 'package:movie_app/fetures/movie/domain/repository/movies_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final MoviesRepo baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

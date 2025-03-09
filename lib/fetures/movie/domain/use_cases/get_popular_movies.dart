import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/fetures/movie/domain/entities/movie.dart';
import 'package:movie_app/fetures/movie/domain/repository/movies_repo.dart';

class GetPopularMovies extends BaseUseCase<List<Movie>, NoParameters> {
  final MoviesRepo baseMoviesRepo;

  GetPopularMovies(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepo.GetPopularMovies();
  }
}

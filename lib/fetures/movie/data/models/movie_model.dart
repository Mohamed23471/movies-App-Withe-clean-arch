import 'package:movie_app/fetures/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.title,
    required super.poster,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.id,
    required super.backdrop,
    required super.genreIds,
    required super.backdropPath,
  });
  factory MovieModel.fromJosn(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      poster: json['poster_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      id: json['id'],
      backdrop: json['backdrop_path'],
      genreIds: json['genre_ids'],
      backdropPath: '',
    );
  }
}

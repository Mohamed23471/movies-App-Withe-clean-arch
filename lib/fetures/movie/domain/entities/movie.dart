import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String poster;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int id;
  final String backdrop;
  final List<int> genreIds;

  const Movie({
    required this.title,
    required this.poster,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
    required this.backdrop,
    required this.genreIds,
    required String backdropPath,
  });

  @override
  List<Object?> get props => [
        title,
        poster,
        overview,
        releaseDate,
        voteAverage,
        id,
        backdrop,
        genreIds
      ];
}

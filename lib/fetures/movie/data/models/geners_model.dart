import 'package:movie_app/fetures/movie/domain/entities/geners.dart';

class GenresModel extends Genres {
  const GenresModel({
    required super.name,
    required super.id,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json["id"],
        name: json["name"],
      );
}

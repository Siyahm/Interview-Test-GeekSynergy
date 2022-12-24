import 'dart:developer';

import 'package:api_test/config/app_exceptions.dart';
import 'package:api_test/constants/api_end_points.dart';
import 'package:api_test/constants/app_urls.dart';
import 'package:api_test/model/movie_get_model.dart';
import 'package:api_test/model/movie_post_model.dart';
import 'package:dio/dio.dart';

class MovieServices {
  Future<AllMovies?> getAllMovies(MoviePostModel moviePostModel) async {
    try {
      Dio dio = Dio();
      const url = AppUrls.baseUrl + ApiEndPoints.movie;

      final Response response =
          await dio.post(url, data: moviePostModel.toJson());
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        AllMovies allMovies = AllMovies.fromJson(response.data);
        return allMovies;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}

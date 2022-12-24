import 'package:api_test/helpers/preference_manager.dart';
import 'package:api_test/model/movie_get_model.dart';
import 'package:api_test/model/movie_post_model.dart';
import 'package:api_test/routes/route_names.dart';
import 'package:api_test/services/movie_services.dart';
import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getAllMovies();
  }
  bool isLoading = false;

  AllMovies? allMovies;

  void getAllMovies() async {
    isLoading = true;
    notifyListeners();
    MoviePostModel moviePostModel = MoviePostModel(
      category: 'movies',
      language: 'kannada',
      genre: 'all',
      sort: 'voting',
    );
    await MovieServices().getAllMovies(moviePostModel).then((value) {
      if (value != null) {
        allMovies = value;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void logOut(BuildContext context) async {
    PreferenceManager manager = PreferenceManager();
    await manager.logOut().then((value) {
      Navigator.of(context).pushReplacementNamed(RouteNames.loginScreen);
    });
  }
}

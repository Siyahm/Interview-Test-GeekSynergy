import 'package:api_test/helpers/preference_manager.dart';
import 'package:api_test/routes/route_names.dart';
import 'package:flutter/cupertino.dart';

class SplashController with ChangeNotifier {
  PreferenceManager preferenceManager = PreferenceManager();
  void checkUserLoginState(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final userLogged = await preferenceManager.getTokenValue();
    if (userLogged == true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteNames.homeScreen, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteNames.loginScreen, (route) => false);
    }
  }
}

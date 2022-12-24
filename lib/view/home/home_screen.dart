import 'package:api_test/view/home/widgets/drawer.dart';
import 'package:api_test/view/home/widgets/movie_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Movies'),
      ),
      drawer: const DrawerWidget(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(17.0),
          child: MovieListWidget(),
        ),
      ),
    );
  }
}

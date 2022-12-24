import 'package:api_test/constants/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) => value.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : value.allMovies == null
              ? const SizedBox()
              : value.allMovies!.result.isEmpty
                  ? const Center(
                      child: Text('No data'),
                    )
                  : ListView.separated(
                      itemCount: value.allMovies!.result.length,
                      itemBuilder: (context, index) {
                        final data = value.allMovies!.result[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const Icon(
                                        Icons.arrow_drop_up,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                      Text('${data.totalVoted ?? '0'}'),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                      const Text('Votes'),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    height: 150,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              data.poster ?? AppUrls.noImage,
                                            ),
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data.title!,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Genre: ${data.genre ?? 'No genre found'}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Director: ${data.director?[0] ?? 'No director found'}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Starring: ${data.star!.join(',')}',
                                          style: const TextStyle(fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Mins | ${data.language ?? 'No language'}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${data.pageViews ?? 'Not found'} views | Voted by ${data.totalVoted ?? '0'} people',
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.teal),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 35),
                              ),
                              onPressed: () {},
                              child: const Text('Watch Trailer'),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1.4,
                        );
                      },
                    ),
    );
  }
}

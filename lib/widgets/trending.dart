import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modifiedText(
            text: "Trending Movies",
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']))),
                          ),
                          Container(
                            child: modifiedText(
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'loading',
                                color: Colors.white,
                                size: 20),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
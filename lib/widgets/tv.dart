import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modifiedText(
            text: " Popular TV Shows",
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: tv[index]['original_name'],
                                    description: tv[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    vote: tv[index]['vote_average'].toString(),
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path'],
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: modifiedText(
                                text: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
                                    : 'loading',
                                color: Colors.white,
                                size: 15),
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

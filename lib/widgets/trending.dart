import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Trending Movies",
            color: Colors.black,
            size: 20,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: trending[index]['title'],
                                description: trending[index]['overview'],
                                banner_url: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                poster_url: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                rating:
                                    trending[index]['vote_average'].toString(),
                                launch_date: trending[index]['release_date'])));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 5),
                    width: 305,
                    child: Column(
                      children: [
                        Container(
                          width: 305,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Container(
                          child: modified_text(
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'Loading',
                            color: Colors.black,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Top Rated Movies",
            color: Colors.black,
            size: 20,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: toprated[index]['title'],
                                description: toprated[index]['overview'],
                                banner_url: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                poster_url: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                                rating:
                                    toprated[index]['vote_average'].toString(),
                                launch_date: toprated[index]['release_date'])));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']))),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Container(
                          child: modified_text(
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'Loading',
                              color: Colors.black,
                              size: 12),
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

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Popular TV Shows",
            color: Colors.black,
            size: 20,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            height: 240,
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
                                banner_url: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                                poster_url: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                                rating: tv[index]['vote_average'].toString(),
                                launch_date: tv[index]['first_air_date'])));
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
                                          tv[index]['poster_path']))),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Container(
                          child: modified_text(
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
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

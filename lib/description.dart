// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, banner_url, poster_url, rating, launch_date;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.banner_url,
      required this.poster_url,
      required this.rating,
      required this.launch_date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: ListView(children: [
        Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(banner_url, fit: BoxFit.cover),
                )),
                Positioned(
                  bottom: 10,
                  child: modified_text(
                      text: ' ⭐ Average Rating - ' + rating,
                      color: Colors.white,
                      size: 18),
                )
              ],
            )),
        Padding(padding: EdgeInsets.only(top: 5)),
        Container(
          padding: EdgeInsets.all(10),
          child: modified_text(text: name, color: Colors.black, size: 22),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: modified_text(
              text: 'Released On : ' + launch_date,
              color: Colors.black87,
              size: 14),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
              height: 200,
              width: 100,
              child: Image.network(poster_url),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(top: 10, right: 5),
                child: modified_text(
                  text: description,
                  color: Colors.black87,
                  size: 16,
                ),
              ),
            )
          ],
        )
      ])),
    );
  }
}

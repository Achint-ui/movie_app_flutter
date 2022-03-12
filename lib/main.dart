import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trending_movies = [];
  List top_rated_movies = [];
  List tv = [];
  final String apikey = '8864041a25f41f3b40d1e301d2c9d6d0';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ODY0MDQxYTI1ZjQxZjNiNDBkMWUzMDFkMmM5ZDZkMCIsInN1YiI6IjYyMmFlMDQ5MDY5ZjBlMDA3MDJlNzkzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ORH46jCKX27QoTjWVfkE9cPH5qeeTEBv8RXm01gej00';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trending_movies = trendingresult['results'];
      top_rated_movies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
        title: Center(
          child: Text(
            "Movie App",
            style: GoogleFonts.ibmPlexSans(),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trending_movies),
          TopRated(
            toprated: top_rated_movies,
          ),
          TV(tv: tv),
        ],
      ),
    );
  }
}

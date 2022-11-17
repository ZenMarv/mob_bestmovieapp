import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'utils/text.dart';
import 'widgets/trending.dart';
import 'package:mob_bestmovieapp/widgets/secret.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.red),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List topratedmovies = [];
  List tv = [];
  final String apikey = '6c1cc2ae77b7b9cd5fc2490f81c2b2c1';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YzFjYzJhZTc3YjdiOWNkNWZjMjQ5MGY4MWMyYjJjMSIsInN1YiI6IjYzMzU5NzE2YmJkMGIwMDA5MTBiZTQ4YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9qdaldxu0APypgbdu5IYZGPZsijw2_4QrDZ3wW0ktUM';

  Future<List> loadmovie() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    // Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    // Map tvresult = await tmdbWithCustomLogs.v3.tv.getTopRated();

    return trendingresult['results'];
    // topratedmovies = topratedresult['results'];
    // tv = tvresult['result'];
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadmovie(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: modified_text(text: 'The Watcher 3'),
            ),
            body: ListView(
              children: [TrendingMovies(trending: snapshot.data!)],
            ),
            bottomNavigationBar: ElevatedButton(
              child: modified_text(
                text: 'Geheim...',
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Secret()));
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    // this happens only once. They first time it get's mounted
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    // I have to make sure i turn off the sink
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // this line will only move on to the next line once the movies has been collected
    bloc.fetchAllMovies(); // fetches movies then adds the movie to the stream in block
    return Scaffold(
        appBar: AppBar(
          title: Text('Popular Movies'),
        ),
        body: StreamBuilder(
            stream: bloc
                .allMovies, // this is the stream in movies_bloc that will be listened too
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  print("ATTENTION-Still waiting");
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.none:
                  print('ATTENTION-no connection');
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  print("ATTENTION-Connection_active");
                  return buildList(snapshot);
                case ConnectionState.done:
                  print("ATTENTION-Connection_done");
                  return buildList(snapshot);
              }
              print("ATTENTION-Skipped the switch cases");
              return Center(child: CircularProgressIndicator());
              /*if (snapshot.hasData) {
                return buildList(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              */
            }));
  }
}

Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
  // adding a number to GridView.builder helps performace of the widget
  return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate:
          // play with this a little bit
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        String image_path =
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}';
        return Image.network(image_path, fit: BoxFit.cover);
      });
}

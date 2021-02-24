import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client(); // makes a stable http request
  final _apiKey = 'f86b84cb8a7cbdac2b0a4ce29b9e3b52';

  // this gets the http reques
  Future<ItemModel> fetchMovieList() async {
    print("ATTENTION-entered");
    final response = await client
        .get('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');

    print(response.body.toString());
    if (response.statusCode == 200) {
      print("ATTENTION-I got a response");
      // If the call to the server was successful, parse the Json
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      print("ATTENTION-I got an error");
      throw Exception('Failed to load post');
    }
  }
}
